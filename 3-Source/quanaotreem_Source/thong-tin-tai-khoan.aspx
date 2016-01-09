<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true"
    CodeFile="thong-tin-tai-khoan.aspx.cs" Inherits="thong_tin_tai_khoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" runat="Server">
    <span>Thông tin tài khoản</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title-d desktop-992">
        Chỉnh sửa thông tin tài khoản</h1>
    <h2 class="title-list mobile-992">
        <a class="panel-a" href="#mobileRight" data-position="false" data-type="false">Thông
            tin tài khoản<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <asp:FormView ID="FormView1" DataSourceID="odsAddressBook" DataKeyNames="AddressBookID"
        runat="server" OnDataBound="FormView1_DataBound">
        <ItemTemplate>
            <div class="wrap-register">
                <div class="register-info">
                    <h2 class="tit-tb">
                        Thông tin khách hàng</h2>
                    <p class="fsi">
                        vui lòng điền đầy đủ thông tin bên dưới:</p>
                    <div class="info-input">
                        <label class="info-lb">
                            Email<span class="error-lb">*</span></label>
                            <asp:HiddenField ID="hdnAddressBookID" Value='<%# Eval("AddressBookID") %>' runat="server" />
                        <div class="info-text">
                            <label class="email-lb">
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label></label>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Họ và tên<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtFullName" CssClass="info-textbox" Text='<%# Eval("FirstName") %>'
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                    Display="Dynamic" ValidationGroup="InformationAccount" ControlToValidate="txtFullName"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Ngày sinh</label>
                        <div class="info-text">
                            <div class="wrap-date">
                                <div class="date-birday">
                                    <asp:DropDownList ID="ddlDay" CssClass="selectb" runat="server">
                                </asp:DropDownList>
                                </div>
                                <div class="date-birday">
                                    <asp:DropDownList ID="ddlMonth" CssClass="selectb" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="date-birday">
                                    <asp:DropDownList ID="ddlYear" CssClass="selectb" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <asp:HiddenField ID="hdnBirthday" Value='<%# string.IsNullOrEmpty(Eval("Birthday").ToString()) ? "" : Eval("Birthday")  %>'
                                    runat="server" />
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="info-input">
                                <label class="info-lb">
                                    Tỉnh/ Thành phố<span class="error-lb">*</span></label>
                                <div class="info-text">
                                    <div class="infow">
                                        <asp:DropDownList ID="ddlProvince" AutoPostBack="true" DataSourceID="OdsProvince"
                                            DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="selectb" runat="server">
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hdnProvinceID" Value='<%# Eval("ProvinceID")%>' runat="server" />
                                        <asp:ObjectDataSource ID="OdsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                            TypeName="TLLib.Province">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProvinceID" Type="String" />
                                                <asp:Parameter Name="ProvinceName" Type="String" />
                                                <asp:Parameter Name="ShortName" Type="String" />
                                                <asp:Parameter Name="CountryID" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="info-input">
                                <label class="info-lb">
                                    Quận/ Huyện<span class="error-lb">*</span></label>
                                <div class="info-text">
                                    <div class="infow">
                                        <asp:DropDownList ID="ddlDistrict" DataSourceID="OdsDistrict" DataTextField="DistrictName"
                                            DataValueField="DistrictID" CssClass="selectb" runat="server">
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hdnDistrictID" Value='<%# Eval("DistrictID")%>' runat="server" />
                                        <asp:ObjectDataSource ID="OdsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                            TypeName="TLLib.District">
                                            <SelectParameters>
                                                <asp:Parameter Name="DistrictName" Type="String" />
                                                <asp:ControlParameter ControlID="ddlProvince" Name="ProvinceIDs" PropertyName="SelectedValue"
                                                    Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="info-input">
                        <label class="info-lb">
                            Địa chỉ<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtAddress" CssClass="info-textbox" runat="server" Text='<%# Eval("Address1") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                    Display="Dynamic" ValidationGroup="InformationAccount" ControlToValidate="txtAddress"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="info-input">
                        <label class="info-lb">
                            Điện thoại<span class="error-lb">*</span></label>
                        <div class="info-text">
                            <div class="infow">
                                <asp:TextBox ID="txtPhone" CssClass="info-textbox" Text='<%# Eval("HomePhone") %>'
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                    Display="Dynamic" ValidationGroup="InformationAccount" ControlToValidate="txtPhone"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <%--<div class="info-input">
                <label class="info-lb">
                    <span class="error-lb">*</span>Mã an toàn</label>
                <div class="info-text">
                    <asp:TextBox ID="txtVerifyCode" CssClass="info-textbox" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                        WatermarkText="--Mật khẩu--" TargetControlID="txtConfirmPassWordRegister">
                    </asp:TextBoxWatermarkExtender>
                    <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="Register"
                        runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                        Display="Dynamic">
                        <CaptchaImage Width="155" RenderImageOnly="True" />
                    </asp:RadCaptcha>
                </div>
            </div>--%>
                    <div class="info-input">
                        <div class="info-btn">
                            <asp:Button ID="btnRegister" runat="server" CssClass="btn-a" ValidationGroup="Register"
                                Text="Cập nhật" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="OdsAddressBook" runat="server" SelectMethod="AddressBookSelectAll"
        TypeName="TLLib.AddressBook">
        <SelectParameters>
            <asp:Parameter Name="AddressBookID" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="CellPhone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:SessionParameter SessionField="UserName" Name="UserName" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="CountryID" Type="String" />
            <asp:Parameter Name="ProvinceID" Type="String" />
            <asp:Parameter Name="DistrictID" Type="String" />
            <asp:Parameter Name="IsPrimary" Type="String" />
            <asp:Parameter Name="IsPrimaryBilling" Type="String" />
            <asp:Parameter Name="IsPrimaryShipping" Type="String" />
            <asp:Parameter Name="RoleName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
