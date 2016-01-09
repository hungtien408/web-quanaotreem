<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true" CodeFile="quan-ly-tai-khoan.aspx.cs" Inherits="quan_ly_tai_khoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" Runat="Server">
        <span>Quản lý tài khoản</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="title-list mobile-992 mbp10"><a class="panel-a" href="#mobileRight"  data-position="false" data-type="false">Quản lý tài khoản<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <h2 class="title mt15">Xin chào <span>Nguyễn Thị Hoa</span></h2>
    <p class="fsia">Trong mục quản lý tài khoản, bạn có thể xem các hoạt động gần đâycủa bạn cũng như quản lý thông tin tài khoản. Chọn link bên dưới để xem hoặc chỉnh sửa thông tin</p>
    
                <div class="section-cart login-box">
                    <div class="addres-info box-left">
                        <h2 class="tit-tb">Thông tin tài khoản</h2>
                        <div class="box-account">
                             <p><span class="account-tit">Họ tên:</span> <span class="name">Nguyễn Thị Hoa</span></p>
                             <p><span class="account-tit">Email:</span> hoanguyen@yahoo.com</p>
                             <p class="link-line"><a href="doi-mat-khau.aspx">Thay đổi mật khẩu</a></p>
                             <a class="repair" href="thong-tin-tai-khoan.aspx"">Chỉnh sửa</a>
                        </div>
                    </div>
                    <div class="addres-info box-right">
                        <h2 class="tit-tb">Bản tin</h2>
                        <div class="box-account">
                             <p>Bạn đang nhận các email thông báo như sau:</p>
                             <p><asp:CheckBox ID="CheckBox2" CssClass="check-one" runat="server" Text="Newletter"/></p>
                             <a class="repair" href="thong-tin-tai-khoan.aspx"">Chỉnh sửa</a>
                        </div>
                    </div>
                    <div class="box-register">
                        <h3 class="tit-tb">Địa chỉ liên hệ</h3>
                        <div class="box-account">
                             <p><span class="account-tit">Họ tên:</span> <span class="name">Nguyễn Thị Hoa</span></p>
                             <p><span class="account-tit">Địa chỉ:</span> hoanguyen@yahoo.com</p>
                             <p><span class="account-tit">Điện thoại:</span> <span class="phone">0906211311</span></p>
                             <a class="repair" href="thong-tin-tai-khoan.aspx"">Chỉnh sửa</a>
                        </div>
                    </div>
                </div>
</asp:Content>

