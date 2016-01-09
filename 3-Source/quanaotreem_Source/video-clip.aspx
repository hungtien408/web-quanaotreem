<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="video-clip.aspx.cs" Inherits="video_clip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~/" runat="server"><span class="fa fa-home"></span></a>&raquo;
            <a href="video.aspx">Video</a> &raquo; <span>
                <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
        </div>
        <asp:ListView ID="lstVideoDetails" runat="server" DataSourceID="odsVideoDetails"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="videow">
                    <div id="jwplayervideo">
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jwplayer('jwplayervideo').setup({
                                file: '<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "../res/video/" + Eval("VideoPath") %>',
                                flashplayer: "assets/js/jwplayer.flash.swf",
                                width: '100%',
                                aspectratio: '16:9'
                            });
                            jwplayer('jwplayervideo').play();
                        });
                    </script>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsVideoDetails" runat="server" SelectMethod="VideoSelectOne"
            TypeName="TLLib.Video">
            <SelectParameters>
                <asp:QueryStringParameter Name="VideoID" QueryStringField="vi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="wrapper-in">
                    <asp:ListView ID="lstVideo" runat="server" DataSourceID="odsVideo" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="col-md-3 col-xs-4 element-item">
                                <div class="video-box">
                                    <a class="fullbox-img video-img" href='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("VideoID") + ".aspx" %>'>
                                        <img class="hideo" alt='<%# Eval("ImagePath") %>' src='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-aodai.jpg" %>'
                                            runat="server" />
                                        <span class="video-mask"><strong></strong></span></a>
                                    <h4 class="video-name">
                                        <a href='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("VideoID") + ".aspx" %>'>
                                            <%# Eval("Title")%></a></h4>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="productwrap" class="row tb-video">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsVideo" runat="server" SelectMethod="VideoSelectAll"
                        TypeName="TLLib.Video">
                        <SelectParameters>
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="VideoCategoryID" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div id="pagerp" class="pager">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstVideo">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                                ShowPreviousPageButton="false" ButtonCssClass="first fa fa-backward" RenderDisabledButtonsAsLabels="true"
                                FirstPageText="" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowNextPageButton="false"
                                ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-caret-left" RenderDisabledButtonsAsLabels="true"
                                PreviousPageText="" />
                            <asp:NumericPagerField ButtonCount="5" CurrentPageLabelCssClass="current" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next fa fa-caret-right"
                                ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                NextPageText="" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ButtonCssClass="last fa fa-forward"
                                ShowNextPageButton="false" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                LastPageText="" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
