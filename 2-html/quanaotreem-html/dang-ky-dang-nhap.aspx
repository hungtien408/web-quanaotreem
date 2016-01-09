<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="dang-ky-dang-nhap.aspx.cs" Inherits="dang_ky_dang_nhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Đăng ký - Đăng nhập</title>
    <meta name="description" content="Đăng ký - Đăng nhập" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~/" runat="server"><span class="fa fa-home"></span></a>&raquo;
            <span>Giỏ hàng</span>
        </div>
        <div class="wrapper-cart">
            <ul id="menu-control">
                <li>
                    <div class="box-me corner">
                        <div class="me-name">Giỏ hàng</div> 
                    </div>
                </li>
                <li class="active">
                    <div class="box-me corner">
                        <div class="me-name">Đăng ký<br />Đăng nhập</div> 
                    </div>
                </li>
                <li>
                    <div class="box-me corner">
                        <div class="me-name">Thông tin<br />thanh toán</div> 
                    </div>
                </li>
                <li class="last">
                    <div class="box-me corner">
                        <div class="me-name">Xác nhận<br />đơn hàng</div> 
                    </div>
                </li>
            </ul>
            <div id="box-content">
                <div class="section-cart login-box">
                    <div class="addres-info box-left">
                        <h2 class="tit-tb">Mua hàng mà không đăng nhập</h2>
                        <div class="form-info">
                            <p class="fsi">Bạn vui lòng nhập email để tiếp tục tiến trình mua hàng</p>
                            <div class="info-input">
                                <label class="info-lb">
                                    Email<span class="error-lb">*</span></label>
                                <div class="info-text">
                                    <asp:TextBox ID="txtEmailNoRegister" CssClass="info-textbox" runat="server" Text=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="info-input">
                                <div class="info-btn">
                                    <asp:Button ID="btnOrderNoRegister" 
                                        runat="server" CssClass="btn-a" Text="Tiếp tục" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="addres-info box-right">
                        <h2 class="tit-tb">Đã có tài khoản</h2>
                        <div class="form-info">
                            <p class="fsi">Aliquam dapibus tincidunt metus praesent justo dolor, lobortis quis, lobortis dignissim ulvinar ac lorem</p>
                            <div class="info-input">
                                <label class="info-lb">
                                    Email<span class="error-lb">*</span></label>
                                <div class="info-text">
                                    <asp:TextBox ID="UserName" CssClass="info-textbox" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="info-input">
                                <label class="info-lb">
                                    Mật khẩu<span class="error-lb">*</span></label>
                                <div class="info-text">
                                    <asp:TextBox ID="Password" TextMode="Password" CssClass="info-textbox" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="info-input">
                                <div class="info-btn">
                                    <asp:Button ID="LoginButton" CommandName="Login" runat="server" 
                                        CssClass="btn-a" Text="đăng nhập" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-register text-center">
                        <h3 class="tit-tb">Bạn chưa đăng kí tài khoản?</h3>
                        <p class="fsi">Hãy đăng kí ngay để thường xuyên nhận được
                            các chương trình ưu đãi từ Caparies Parfum</p>
                        <p class="btn-register">
                            <a class="btn-a link-show" href="#resiterwrap">đăng Kí</a></p>
                    </div>
                </div>
    <div id="resiterwrap" class="wrap-register">
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
            <div class="clr"></div>
        </div>
    </div>
</asp:Content>

