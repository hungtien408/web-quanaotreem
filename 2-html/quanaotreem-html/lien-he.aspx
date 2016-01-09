<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content5" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=vi"></script>
    <title>LITTLE ANFLES</title>
    <meta name="description" content="LITTLE ANFLES" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="container">

        <div id="site">
            <a id="A1" href="~/" runat="server"><span class="fa fa-home"></span></a>&raquo; <span>Liên hệ</span>
        </div>
        <div class="contact">
            <div class="row">
                <div class="col-lg-6 col-md-5">
                    <!--address-->
                    <div class="address-company">
                        <h2>little angles</h2>
                        <div class="addess-box">
                            <p><span class="icon glyphicon glyphicon-map-marker"></span>Địa chỉ: 673 Lê Hồng Phong, Phường 10, Quận 10, TPHCM</p>
                            <p><span class="icon glyphicon glyphicon-earphone"></span>Tel: 0908 563 644 (Mr.Hiền) - 0902 717 575 (Ms. Điêp )</p>
                            <p><span class="icon fa fa-phone-square"></span>Facebook: <a href="http://www.facebook.com/shopnguyenhien" target="_blank">www.facebook.com/shopnguyenhien</a></p>
                            <p><span class="icon glyphicon glyphicon-envelope"></span>Web: <a href="http://www.nguyenhienshop.com">www.nguyenhienshop.com</a></p>
                        </div>
                    </div>
                    <!--sendmail map-->
                    <div class="cart-form">
                        <div class="send-mail">
                            <h2>Gửi thư</h2>
                            <div class="node">Donec sit amet diam sed ligula elementum ultrices. Morbi as molestie a nunc sed faucibus equat mauris</div>
                            <div class="form-input">
                                <label class="form-lb">Họ và tên<span class="error">*</span></label>
                                <div class="form-text">
                                    <asp:TextBox CssClass="input-text corner" ID="txtHoTen" runat="server" Text="Nhập họ tên..."></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                        ValidationGroup="SendEmail" ControlToValidate="txtHoTen" ErrorMessage="Thông tin bắt buộc!"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-input">
                                <label class="form-lb">Điện thoại<span class="error">*</span></label>
                                <div class="form-text">
                                    <asp:TextBox CssClass="input-text corner" ID="txtPhone" runat="server" Text="Nhập điện thoại..."></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" Display="Dynamic" runat="server"
                                        ControlToValidate="txtPhone" ValidationGroup="SendEmail" ErrorMessage="Thông tin bắt buộc!"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-input">
                                <label class="form-lb">Email<span class="error">*</span></label>
                                <div class="form-text">
                                    <asp:TextBox CssClass="input-text corner" ID="txtEmail" runat="server" Text="Nhập email..."></asp:TextBox>
                                    <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1" runat="server" ValidationGroup="SendEmail"
                                        ControlToValidate="txtEmail" ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server" ValidationGroup="SendEmail"
                                        ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-input">
                                <label class="form-lb">Nội dung<span class="error">*</span></label>
                                <div class="form-text">
                                    <asp:TextBox CssClass="input-area corner" ID="txtNoiDung" runat="server" TextMode="MultiLine" Text="Nhập nội dung..."></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server" ValidationGroup="SendEmail"
                                        Display="Dynamic" ControlToValidate="txtNoiDung" ErrorMessage="Thông tin bắt buộc!"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-input">
                                <label class="form-lb">Mã xác nhận<span class="error">*</span></label>
                                <div class="form-text">
                                    <div class="codes">
                                        <asp:TextBox ID="txtVerifyCode" CssClass="input-code corner" runat="server"></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                                            Enabled="True" WatermarkText="Mã xác nhận" TargetControlID="txtVerifyCode">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RadCaptcha ID="RadCaptcha1" ValidatedTextBoxID="txtVerifyCode" ValidationGroup="SendEmail"
                                            runat="server" Display="Dynamic"
                                            ErrorMessage="Mã xác nhận: không chính xác." CaptchaLinkButtonText="Refesh"
                                            CssClass="capcha" EnableRefreshImage="True">
                                            <CaptchaImage RenderImageOnly="True" Width="125" Height="38" BackgroundNoise="High" BackgroundColor="White" TextColor="Black" FontFamily="Tohoma" TextLength="5" />
                                        </asp:RadCaptcha>
                                    </div>
                                </div>
                            </div>
                            <div class="form-input">
                                <div class="wrap-btn">
                                    <asp:Button ID="btGui" CssClass="btn-a corner" runat="server" Text="gửi mail" ValidationGroup="SendEmail" OnClick="btGui_Click" />
                                    <div class="node"><span class="error">*</span> Thông tin bắt buộc</div>
                                </div>
                            </div>
                            <div class="form-input">
                                <asp:Label runat="server" ID="lblMessage" ForeColor="red"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-6 col-md-7">

                    <div id="result" class="map-wrap">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>

