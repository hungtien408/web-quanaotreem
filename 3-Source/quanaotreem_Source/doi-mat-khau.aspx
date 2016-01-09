<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true"
    CodeFile="doi-mat-khau.aspx.cs" Inherits="doi_mat_khau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" runat="Server">
    <span>Đổi mật khẩu</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title-d desktop-992">
        Đổi mật khẩu</h1>
    <h2 class="title-list mbp10 mobile-992">
        <a class="panel-a" href="#mobileRight" data-position="false" data-type="false">Đổi mật
            khẩu<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <div class="wrap-register">
        <div class="register-info">
            <h2 class="tit-tb">
                Thông tin</h2>
            <p class="fsi">
                vui lòng điền đầy đủ thông tin bên dưới:</p>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:ChangePassword ID="ChangePassword1" runat="server" Width="80%" OnContinueButtonClick="ChangePassword1_ContinueButtonClick"
                        ChangePasswordFailureText="Mật khẩu không chính xác hoặc Mật khẩu mới không hợp lệ. Mật độ dài tối thiểu mới: {0}. Ký tự chữ số yêu cầu: {1}.">
                        <ChangePasswordTemplate>
                            <asp:Panel ID="Panel3" DefaultButton="ChangePasswordPushButton" runat="server">
                                <div class="info-input">
                                    <label class="info-lb">
                                        Mật khẩu cũ<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="CurrentPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                                Display="Dynamic" ValidationGroup="ChangePassword" ControlToValidate="CurrentPassword"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Mật khẩu mới<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="NewPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                                Display="Dynamic" ValidationGroup="ChangePassword" ControlToValidate="NewPassword"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Nhập lại mật khẩu<span class="error-lb">*</span></label>
                                    <div class="info-text">
                                        <div class="infow">
                                            <asp:TextBox ID="ConfirmNewPassword" CssClass="info-textbox" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                                Display="Dynamic" ValidationGroup="ChangePassword" ControlToValidate="ConfirmNewPassword"
                                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Vui lòng nhập lại mật khẩu mới."
                                                ValidationGroup="ChangePassword"></asp:CompareValidator>
                                            <asp:Literal ID="Literal1" runat="server" EnableViewState="False"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <div class="info-btn">
                                        <asp:Button ID="ChangePasswordPushButton" CommandName="ChangePassword" runat="server"
                                            CssClass="btn-a" ValidationGroup="ChangePassword" Text="Cập nhật" />
                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Hủy" CssClass="btn-a" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </ChangePasswordTemplate>
                        <SuccessTemplate>
                            <asp:Panel ID="Panel4" DefaultButton="ContinuePushButton" runat="server">
                                <fieldset class="addres-info">
                                    <p style="font-size: 14px;">
                                        Bạn đã thay đổi mật khẩu thành công.</p>
                                    <br />
                                    <p>
                                        <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue"
                                            Text="Tiếp tục" CssClass="btn-button" /></p>
                                </fieldset>
                            </asp:Panel>
                        </SuccessTemplate>
                    </asp:ChangePassword>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
