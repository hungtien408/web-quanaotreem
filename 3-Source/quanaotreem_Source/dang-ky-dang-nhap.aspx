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
                        <div class="me-name">
                            Giỏ hàng</div>
                    </div>
                </li>
                <li class="active">
                    <div class="box-me corner">
                        <div class="me-name">
                            Đăng ký<br />
                            Đăng nhập</div>
                    </div>
                </li>
                <li>
                    <div class="box-me corner">
                        <div class="me-name">
                            Thông tin<br />
                            thanh toán</div>
                    </div>
                </li>
                <li class="last">
                    <div class="box-me corner">
                        <div class="me-name">
                            Xác nhận<br />
                            đơn hàng</div>
                    </div>
                </li>
            </ul>
            <div id="box-content">
                <div class="section-cart login-box">
                    <div class="addres-info box-left">
                        <h2 class="tit-tb">
                            Mua hàng mà không đăng nhập</h2>
                        <div class="form-info">
                            <p class="fsi">
                                Bạn vui lòng nhập email để tiếp tục tiến trình mua hàng</p>
                            <div class="info-input">
                                <label class="info-lb">
                                    Email<span class="error-lb">*</span></label>
                                <div class="info-text">
                                    <asp:TextBox ID="txtEmailNoRegister" CssClass="info-textbox" runat="server" Text=""></asp:TextBox>
                                    <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                        runat="server" ValidationGroup="NoRegister" ControlToValidate="txtEmailNoRegister"
                                        ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                        ValidationGroup="NoRegister" ControlToValidate="txtEmailNoRegister" ErrorMessage="Thông tin bắt buộc!"
                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="info-input">
                                <div class="info-btn">
                                    <asp:Button ID="btnOrderNoRegister" OnClick="btnOrderNoRegister_Click" ValidationGroup="NoRegister" runat="server" CssClass="btn-a" Text="Tiếp tục" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="addres-info box-right">
                        <h2 class="tit-tb">
                            Đã có tài khoản</h2>
                        <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn" FailureText="Đăng nhập không thành công. Vui lòng đăng nhập lại!">
                            <LayoutTemplate>
                                <asp:Panel ID="Panel1" DefaultButton="LoginButton" runat="server">
                                    <div class="form-info">
                                        <p class="fsi">
                                            Aliquam dapibus tincidunt metus praesent justo dolor, lobortis quis, lobortis dignissim
                                            ulvinar ac lorem</p>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Email<span class="error-lb">*</span></label>
                                            <div class="info-text">
                                                <asp:TextBox ID="UserName" CssClass="info-textbox" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                                    Display="Dynamic" ValidationGroup="Login" ControlToValidate="UserName" ErrorMessage="Thông tin bắt buộc!"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Mật khẩu<span class="error-lb">*</span></label>
                                            <div class="info-text">
                                                <asp:TextBox ID="Password" TextMode="Password" CssClass="info-textbox" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                                    Display="Dynamic" ValidationGroup="Login" ControlToValidate="Password" ErrorMessage="Thông tin bắt buộc!"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <div class="info-text">
                                                <asp:Button ID="LoginButton" CommandName="Login" runat="server" ValidationGroup="Login"
                                                    CssClass="btn-button" Text="đăng nhập" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </LayoutTemplate>
                        </asp:Login>
                    </div>
                    <div class="box-register text-center">
                        <h3 class="tit-tb">
                            Bạn chưa đăng kí tài khoản?</h3>
                        <p class="fsi">
                            Hãy đăng kí ngay để thường xuyên nhận được các chương trình ưu đãi từ Caparies Parfum</p>
                        <p class="btn-register">
                            <a class="btn-a link-show" href="#resiterwrap">đăng Kí</a></p>
                    </div>
                </div>
                <div id="resiterwrap" class="wrap-register">
                    <div class="register-info">
                        <h2 class="tit-tb">
                            Thông tin khách hàng</h2>
                        <p class="fsi">
                            vui lòng điền đầy đủ thông tin bên dưới:</p>
                        <div class="info-input">
                            <label class="info-lb">
                                Họ và tên<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <div class="infow">
                                    <asp:TextBox ID="txtFullName" CssClass="info-textbox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                        Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtFullName"
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
                                            <asp:DropDownList ID="ddlProvince" AutoPostBack="true" DataSourceID="odsProvince"
                                                DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="selectb" runat="server">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="odsProvince" runat="server" SelectMethod="ProvinceSelectAll"
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
                                    <asp:TextBox ID="txtAddress" CssClass="info-area" runat="server" TextMode="MultiLine"
                                        Text=""></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                        Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtAddress" ErrorMessage="Thông tin bắt buộc!"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="info-input">
                            <label class="info-lb">
                                Điện thoại<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <div class="infow">
                                    <asp:TextBox ID="txtPhone" CssClass="info-textbox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator7" runat="server"
                                        Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtPhone" ErrorMessage="Thông tin bắt buộc!"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="info-input">
                            <label class="info-lb">
                                Email<span class="error-lb">*</span></label>
                            <div class="info-text">
                                <div class="infow">
                                    <asp:TextBox ID="txtEmailRegister" CssClass="info-textbox" runat="server" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
                                    <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator2"
                                        runat="server" ValidationGroup="Register" ControlToValidate="txtEmailRegister"
                                        ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                        Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtEmailRegister"
                                        ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Register" runat="server"
                                        ControlToValidate="txtEmailRegister" Display="Dynamic"></asp:CustomValidator>
                                    <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Register" runat="server"
                                        ControlToValidate="txtEmailRegister" Display="Dynamic"></asp:CustomValidator>
                                    <asp:Label ID="lblEmailMessage" runat="server" ForeColor="Green"></asp:Label>
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
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator6" runat="server"
                                        Display="Dynamic" ValidationGroup="Register" ControlToValidate="txtPasswordRegister"
                                        ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator3"
                                        runat="server" ValidationGroup="Register" ControlToValidate="txtPasswordRegister"
                                        ErrorMessage="Vui lòng nhập ít nhất 6 ký tự" ValidationExpression="^.*(?=.{6,}).*$"
                                        Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
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
                                    <asp:CompareValidator ID="CompareValidator1" Font-Bold="true" ValidationGroup="Register"
                                        runat="server" ErrorMessage="Xác nhận mật khẩu sai" ControlToCompare="txtPasswordRegister"
                                        ControlToValidate="txtConfirmPassWordRegister" Display="Dynamic"></asp:CompareValidator>
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
                                <asp:Button ID="btnRegister" runat="server" CssClass="btn-a" ValidationGroup="Register"
                                    Text="Đăng kí" OnClick="btnRegister_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
</asp:Content>
