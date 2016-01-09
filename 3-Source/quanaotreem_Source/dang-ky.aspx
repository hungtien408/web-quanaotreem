<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="dang-ky.aspx.cs" Inherits="dang_ky_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>ALOHA</title>
    <meta name="description" content="ALOHA" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~/" runat="server"><span class="fa fa-home"></span></a>&raquo;<span>Đăng
                ký tài khoản</span>
        </div>
        <div class="wrap-register w760">
            <h1 class="title-2">
                Đăng ký</h1>
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
                            Text="Đăng kí" onclick="btnRegister_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
