<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true" CodeFile="thong-tin-tai-khoan.aspx.cs" Inherits="thong_tin_tai_khoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" Runat="Server">
       <span>Thông tin tài khoản</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <h1 class="title-d desktop-992">Chỉnh sửa thông tin tài khoản</h1>
    <h2 class="title-list mobile-992"><a class="panel-a" href="#mobileRight"  data-position="false" data-type="false">Thông tin tài khoản<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <div class="wrap-register">
        <div class="register-info">
            <h2 class="tit-tb">Thông tin khách hàng</h2>
            <p class="fsi">vui lòng điền đầy đủ thông tin bên dưới:</p>
            <div class="info-input">
                <label class="info-lb">
                    Email<span class="error-lb">*</span></label>
                <div class="info-text">
                                <label class="email-lb">hoanguyen@yahoo.com</label>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">Họ và tên<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:TextBox ID="TextBox1" CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Ngày sinh</label>
                <div class="info-text">
                    <div class="wrap-date">
                        <div class="date-birday">
                            <asp:DropDownList ID="DropDownList3" CssClass="selectb" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="date-birday">
                            <asp:DropDownList ID="DropDownList5" CssClass="selectb" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="date-birday">
                            <asp:DropDownList ID="DropDownList6" CssClass="selectb" runat="server">
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
                        <asp:DropDownList ID="DropDownList7" CssClass="selectb" runat="server">
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
                        <asp:DropDownList ID="DropDownList8" CssClass="selectb" runat="server">
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
                        <asp:TextBox ID="TextBox2" CssClass="info-area" runat="server" TextMode="MultiLine"
                            Text=""></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">
                    Điện thoại<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                    <asp:TextBox ID="TextBox3" CssClass="info-textbox" runat="server"></asp:TextBox>
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
                    <asp:Button ID="Button1" 
                        runat="server" CssClass="btn-a" ValidationGroup="Register" Text="Cập nhật" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

