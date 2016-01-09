﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="downloadcategory.aspx.cs" Inherits="ad_single_downloadcategory" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function RowMouseOver(sender, eventArgs) {
            var selectedRows = sender.get_masterTableView().get_selectedItems();
            var elem = $get(eventArgs.get_id());
            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();

                    if (selectedID != eventArgs.get_id())
                        elem.className += (" rgSelectedRow");
                }
            else
                elem.className += (" rgSelectedRow");
        }

        function RowMouseOut(sender, eventArgs) {
            var className = "rgSelectedRow";
            var elem = $get(eventArgs.get_id());

            var selectedRows = sender.get_masterTableView().get_selectedItems();

            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();
                    if (selectedID != eventArgs.get_id())
                        removeCssClass(className, elem);
                }
            else
                removeCssClass(className, elem);
        }

        function removeCssClass(className, element) {
            element.className = element.className.replace(className, "").replace(/^\s+/, '').replace(/\s+$/, '');
        }

        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {
            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }

        //On insert and update buttons click temporarily disables ajax to perform upload actions
        function conditionalPostback(sender, eventArgs) {
            var theRegexp = new RegExp("\.lnkUpdate$|\.lnkUpdateTop$|\.PerformInsertButton$", "ig");
            if (eventArgs.get_eventTarget().match(theRegexp)) {
                var upload = $find(window['UploadId']);

                //AJAX is disabled only if file is selected for upload
                if (upload.getFileInputs()[0].value != "") {
                    eventArgs.set_enableAjax(false);
                }
            }
            else if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
                eventArgs.set_enableAjax(false);
        }

        function validateRadUpload(source, e) {
            e.IsValid = false;

            var upload = $find(source.parentNode.getElementsByTagName('div')[0].id);
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                //check for empty string or invalid extension
                if (upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/category.png" class="vam" />
        Danh Mục Download</h3>
    <br />
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback"
        Width="100%">
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" AllowMultiRowSelection="True" runat="server" Culture="vi-VN" 
            DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound"
            CssClass="grid" AllowAutomaticUpdates="True" CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" UseClientSelectColumnOnly="True" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="DownloadCategoryID">
                <PagerStyle AlwaysVisible="true" Mode="NextPrevNumericAndAdvanced" PageButtonCount="10"
                    FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Trang kế"
                    NextPageToolTip="Trang kế" PagerTextFormat="Đổi trang: {4} &nbsp;Trang <strong>{0}</strong> / <strong>{1}</strong>, Kết quả <strong>{2}</strong> - <strong>{3}</strong> trong <strong>{5}</strong>."
                    PageSizeLabelText="Kết quả mỗi trang:" PrevPagesToolTip="Trang trước" PrevPageToolTip="Trang trước" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa</asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item"><img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                            <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="ID" DataField="DownloadCategoryID" SortExpression="DownloadCategoryID">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn HeaderText="Tên danh mục" DataField="DownloadCategoryName"
                        SortExpression="DownloadCategoryName">
                        <ItemTemplate>
                            <asp:Label ID="lblDownloadCategoryName" runat="server" Text='<%# Eval("DownloadCategoryName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Tên danh mục(Tiếng Anh)" DataField="DownloadCategoryName"
                        SortExpression="DownloadCategoryName">
                        <ItemTemplate>
                            <asp:Label ID="lblDownloadCategoryNameEn" runat="server" Text='<%# Eval("DownloadCategoryNameEn")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Thứ tự" DataField="Priority" SortExpression="Priority">
                        <ItemTemplate>
                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="70px" Text='<%# Bind("Priority") %>'
                                ShowSpinButtons="true" MinValue="0" EmptyMessage="Thứ tự..." Type="Number">
                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                            </asp:RadNumericTextBox>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Xem trên menu" DataField="IsShowOnMenu" SortExpression="IsShowOnMenu">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsShowOnMenu" runat="server" Checked='<%# Eval("IsShowOnMenu") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnMenu"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Xem trên trang chủ" DataField="IsShowOnHomePage">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" Checked='<%# Eval("IsShowOnHomePage") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnHomePage"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Hiển thị" DataField="IsAvailable" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Ảnh">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'>
                                <a class="screenshot" rel='../../res/downloadcategory/<%# Eval("ImageName") %>'>
                                    <img alt="" src="../assets/images/photo.png" />
                                </a>
                                <asp:LinkButton ID="lnkDeleteImage" runat="server" rel='<%#  Eval("DownloadCategoryID") + "#" + Eval("ImageName") %>'
                                    CommandName="DeleteImage" OnClientClick="return confirm('Xóa ảnh này ?')">
                            <img alt="Xóa ảnh" title="Xóa ảnh" src="../assets/images/delete-icon.png" />
                                </asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <h3 class="searchTitle">
                                Thông Tin Danh Mục Download</h3>
                            <table class="search">
                                <tr>
                                    <td class="left" valign="top">
                                        Ảnh đại diện
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnDownloadCategoryID" runat="server" Value='<%# Eval("DownloadCategoryID") %>' />
                                        <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                        <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                            Culture="vi-VN" Language="vi-VN" InputSize="69" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                            ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Meta Title
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaTitle" runat="server" Text='<%# Bind("MetaTitle") %>'
                                            Width="500px" EmptyMessage="Meta Title...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Meta Description
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaDescription" runat="server" Text='<%# Bind("MetaDescription") %>'
                                            Width="500px" EmptyMessage="Meta Description...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Tên danh mục
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtDownloadCategoryName" runat="server" Text='<%# Bind("DownloadCategoryName") %>'
                                            Width="500px" EmptyMessage="Tên danh mục...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        Thứ tự
                                    </td>
                                    <td>
                                        <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                            EmptyMessage="Thứ tự..." Type="Number">
                                            <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                        </asp:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Mô tả
                                    </td>
                                    <td>
                                        <asp:RadEditor ID="txtDescription" StripFormattingOptions="MSWordRemoveAll,ConvertWordLists,MSWordNoFonts,Font,Css,Span" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP" runat="server" Height="200" Language="vi-VN" Skin="Office2007"
                                            Width="98%" Content='<%# Bind("Description") %>'>
                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1024000" />
                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1024000" />
                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                ViewPaths="~/Uploads/Template/" />
                                            <Tools>
                                                <asp:EditorToolGroup>
                                                    <asp:EditorTool Name="Copy" />
                                                    <asp:EditorTool Name="Cut" />
                                                    <asp:EditorTool Name="Paste" />
                                                    <asp:EditorTool Name="Bold" />
                                                    <asp:EditorTool Name="Italic" />
                                                    <asp:EditorTool Name="Underline" />
                                                    <asp:EditorTool Name="InsertLink" />
                                                    <asp:EditorTool Name="ForeColor" />
                                                </asp:EditorToolGroup>
                                            </Tools>
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Nội dung
                                    </td>
                                    <td>
                                        <asp:RadEditor ID="txtContent" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP" runat="server" Language="vi-VN" Skin="Office2007"
                                            Width="98%" Content='<%# Bind("Content") %>'>
                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1024000" />
                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1024000" />
                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                ViewPaths="~/Uploads/Template/" />
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <h3>
                                            (Ngôn Ngữ Tiếng Anh)</h3>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Meta Title(En)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaTitleEn" runat="server" Text='<%# Bind("MetaTitleEn") %>'
                                            Width="500px" EmptyMessage="Meta Title(En)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Meta Description(En)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtMetaDescriptionEn" runat="server" Text='<%# Bind("MetaDescriptionEn") %>'
                                            Width="500px" EmptyMessage="Meta Description(En)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Tên danh mục(En)
                                    </td>
                                    <td>
                                        <asp:RadTextBox ID="txtDownloadCategoryNameEn" runat="server" Text='<%# Bind("DownloadCategoryNameEn") %>'
                                            Width="500px" EmptyMessage="Tên danh mục(En)...">
                                        </asp:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Mô tả(En)
                                    </td>
                                    <td>
                                        <asp:RadEditor ID="txtDescriptionEn" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP" runat="server" Height="200" Language="vi-VN"
                                            Skin="Office2007" Width="98%" Content='<%# Bind("DescriptionEn") %>'>
                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1024000" />
                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1024000" />
                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                ViewPaths="~/Uploads/Template/" />
                                            <Tools>
                                                <asp:EditorToolGroup>
                                                    <asp:EditorTool Name="Copy" />
                                                    <asp:EditorTool Name="Cut" />
                                                    <asp:EditorTool Name="Paste" />
                                                    <asp:EditorTool Name="Bold" />
                                                    <asp:EditorTool Name="Italic" />
                                                    <asp:EditorTool Name="Underline" />
                                                    <asp:EditorTool Name="InsertLink" />
                                                    <asp:EditorTool Name="ForeColor" />
                                                </asp:EditorToolGroup>
                                            </Tools>
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Nội dung
                                    </td>
                                    <td>
                                        <asp:RadEditor ID="txtContentEn" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP" runat="server" Language="vi-VN" Skin="Office2007"
                                            Width="98%" Content='<%# Bind("ContentEn") %>'>
                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/" MaxUploadFileSize="1024000" />
                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/" MaxUploadFileSize="1024000" />
                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                ViewPaths="~/Uploads/Template/" />
                                        </asp:RadEditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" colspan="2">
                                        <asp:CheckBox ID="chkIsShowOnMenu" runat="server" CssClass="checkbox" Text=" Xem trên menu"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsShowOnMenu") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnMenu"))) %>' />
                                        &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" CssClass="checkbox" Text=" Xem trên trang chủ"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsShowOnHomePage") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnHomePage"))) %>' />
                                        &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))) %>' />
                                    </td>
                                </tr>
                            </table>
                            <div class="edit">
                                <hr />
                                <asp:RadButton ID="lnkUpdate" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                </asp:RadButton>
                                &nbsp;&nbsp;
                                <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                </asp:RadButton>
                            </div>
                        </asp:Panel>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DownloadCategoryDelete"
        SelectMethod="DownloadCategorySelectAll" TypeName="TLLib.DownloadCategory" InsertMethod="DownloadCategoryInsert"
        UpdateMethod="DownloadCategoryUpdate">
        <DeleteParameters>
            <asp:Parameter Name="DownloadCategoryID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ImageName" Type="String" />
            <asp:Parameter Name="DownloadCategoryName" Type="String" />
            <asp:Parameter Name="DownloadCategoryNameEn" Type="String" />
            <asp:Parameter Name="ConvertedDownloadCategoryName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="DescriptionEn" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="ContentEn" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="MetaTitleEn" Type="String" />
            <asp:Parameter Name="MetaDescription" Type="String" />
            <asp:Parameter Name="MetaDescriptionEn" Type="String" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter Name="SortByPriority" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DownloadCategoryID" Type="String" />
            <asp:Parameter Name="ImageName" Type="String" />
            <asp:Parameter Name="DownloadCategoryName" Type="String" />
            <asp:Parameter Name="DownloadCategoryNameEn" Type="String" />
            <asp:Parameter Name="ConvertedDownloadCategoryName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="DescriptionEn" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="ContentEn" Type="String" />
            <asp:Parameter Name="MetaTitle" Type="String" />
            <asp:Parameter Name="MetaTitleEn" Type="String" />
            <asp:Parameter Name="MetaDescription" Type="String" />
            <asp:Parameter Name="MetaDescriptionEn" Type="String" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important;
        left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>