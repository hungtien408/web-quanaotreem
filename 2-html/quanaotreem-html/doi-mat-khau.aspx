<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true" CodeFile="doi-mat-khau.aspx.cs" Inherits="doi_mat_khau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" Runat="Server">
        <span>Đổi mật khẩu</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="title-d desktop-992">Đổi mật khẩu</h1>
    <h2 class="title-list mbp10 mobile-992"><a class="panel-a" href="#mobileRight"  data-position="false" data-type="false">Đổi mật khẩu<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <div class="wrap-register">
        <div class="register-info">
            <h2 class="tit-tb">Thông tin</h2>
            <p class="fsi">vui lòng điền đầy đủ thông tin bên dưới:</p>
            <div class="info-input">
                <label class="info-lb">Mật khẩu cũ<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:TextBox ID="TextBox2" CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">Mật khẩu mới<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:TextBox ID="TextBox3" CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <label class="info-lb">Nhập lại mật khẩu<span class="error-lb">*</span></label>
                <div class="info-text">
                    <div class="infow">
                        <asp:TextBox ID="TextBox4" CssClass="info-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="info-input">
                <div class="info-btn">
                    <asp:Button ID="Button2" 
                        runat="server" CssClass="btn-a" ValidationGroup="Register" Text="Cập nhật" />
                                <asp:Button ID="Button3" 
                                    runat="server" CssClass="btn-a" ValidationGroup="Register" Text="hủy" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

