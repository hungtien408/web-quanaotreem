<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="dang-ky.aspx.cs" Inherits="dang_ky_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>ALOHA</title>
    <meta name="description" content="ALOHA" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~/" runat="server"><span class="fa fa-home"></span></a>&raquo;<span>Đăng ký  tài khoản</span>
        </div>
    <div  class="wrap-register w760">
        <h1 class="title-2">Đăng ký</h1>
        <div class="register-info">
            <h2 class="tit-tb">Thông tin khách hàng</h2>
            <p class="fsi">vui lòng điền đầy đủ thông tin bên dưới:</p>
            <div class="info-input">
                <label class="info-lb">Họ và tên<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:TextBox ID="txtFullName" CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Ngày sinh</label>
                <div class="info-text">
                    <div class="wrap-date">
                        <div class="date-birday">
                            <asp:DropDownList ID="DropDownList4" CssClass="selectb" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="date-birday">
                            <asp:DropDownList ID="DropDownList3" CssClass="selectb" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="date-birday">
                            <asp:DropDownList ID="DropDownList5" CssClass="selectb" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Tỉnh/ Thành phố<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:DropDownList ID="DropDownList2" CssClass="selectb" runat="server">
                            <asp:ListItem>Tp Hồ Chí Minh</asp:ListItem>
                            <asp:ListItem>Tiền Giang</asp:ListItem>
                            <asp:ListItem>Long An</asp:ListItem>
                            <asp:ListItem>Bến Tre</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Quận/ Huyện<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:DropDownList ID="DropDownList1" CssClass="selectb" runat="server">
                            <asp:ListItem>Tp Hồ Chí Minh</asp:ListItem>
                            <asp:ListItem>Tiền Giang</asp:ListItem>
                            <asp:ListItem>Long An</asp:ListItem>
                            <asp:ListItem>Bến Tre</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Địa chỉ<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:TextBox ID="txtAddress" CssClass="info-area" runat="server" TextMode="MultiLine"
                            Text=""></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Điện thoại<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                    <asp:TextBox ID="txtPhone" CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Email<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                    <asp:TextBox ID="txtEmailRegister"
                        CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Mật khẩu<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                    <asp:TextBox ID="txtPasswordRegister" CssClass="info-textbox" TextMode="Password"
                        runat="server"></asp:TextBox>
                    </div>
                    <div class="infow">
                    <p class="passnode">
                        Mật khẩu ít nhất 6 kí tự bao gồm chữ &amp; số</p>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Nhập lại mật khẩu<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                    <asp:TextBox ID="txtConfirmPassWordRegister" TextMode="Password" CssClass="info-textbox"
                        runat="server"></asp:TextBox>
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
                <div class="info-btn check-text">
                    <p class="w-check">
                        <asp:CheckBox ID="ckbNewsletter" runat="server" Text="Nhận thông tin khuyến mãi qua Email"
                            CssClass="check-ok" /></p>
                    <p class="w-check">
                        <asp:CheckBox ID="ckbSuccess" runat="server" Text="Tôi đồng ý với các điều khoản của Caparies Parfum"
                            CssClass="check-ok checksucess" />
                    </p>
                </div>
            </div>
            <div class="info-input">
                <div class="info-btn">
                    <asp:Button ID="btnRegister" 
                        runat="server" CssClass="btn-a" ValidationGroup="Register" Text="Đăng kí" />
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

