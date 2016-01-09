<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true"
    CodeFile="quan-ly-tai-khoan.aspx.cs" Inherits="quan_ly_tai_khoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" runat="Server">
    <span>Quản lý tài khoản</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="title-list mobile-992 mbp10">
        <a class="panel-a" href="#mobileRight" data-position="false" data-type="false">Quản
            lý tài khoản<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="OdsAddressBook">
        <ItemTemplate>
            <h2 class="title mt15">
                Xin chào <span><%# Eval("FirstName") %></span></h2>
            <p class="fsia">
                Trong mục quản lý tài khoản, bạn có thể xem các hoạt động gần đâycủa bạn cũng như
                quản lý thông tin tài khoản. Chọn link bên dưới để xem hoặc chỉnh sửa thông tin</p>
            <div class="section-cart login-box">
                <div class="addres-info box-left">
                    <h2 class="tit-tb">
                        Thông tin tài khoản</h2>
                    <div class="box-account">
                        <p>
                            <span class="account-tit">Họ tên:</span> <span class="name"><%# Eval("FirstName") %></span></p>
                        <p>
                            <span class="account-tit">Email:</span> <%# Eval("Email") %></p>
                        <p class="link-line">
                            <a href="doi-mat-khau.aspx">Thay đổi mật khẩu</a></p>
                        <a class="repair" href="thong-tin-tai-khoan.aspx">Chỉnh sửa</a>
                    </div>
                </div>
                <div class="addres-info box-right">
                    <h2 class="tit-tb">
                        Bản tin</h2>
                    <div class="box-account">
                        <p>
                            Bạn đang nhận các email thông báo như sau:</p>
                        <p>
                            <asp:CheckBox ID="CheckBox2" CssClass="check-one" runat="server" Text="Newletter" /></p>
                        <a class="repair" href="thong-tin-tai-khoan.aspx">Chỉnh sửa</a>
                    </div>
                </div>
                <div class="box-register">
                    <h3 class="tit-tb">
                        Địa chỉ liên hệ</h3>
                    <div class="box-account">
                        <p>
                            <span class="account-tit">Họ tên:</span> <span class="name"><%# Eval("FirstName") %></span></p>
                        <p>
                            <span class="account-tit">Địa chỉ:</span> <%# Eval("Address1") %></p>
                        <p>
                            <span class="account-tit">Điện thoại:</span> <span class="phone"><%# Eval("HomePhone") %></span></p>
                        <a class="repair" href="thong-tin-tai-khoan.aspx">Chỉnh sửa</a>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="OdsAddressBook" runat="server" SelectMethod="AddressBookSelectAll"
        TypeName="TLLib.AddressBook">
        <SelectParameters>
            <asp:Parameter Name="AddressBookID" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="CellPhone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:SessionParameter SessionField="UserName" Name="UserName" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="CountryID" Type="String" />
            <asp:Parameter Name="ProvinceID" Type="String" />
            <asp:Parameter Name="DistrictID" Type="String" />
            <asp:Parameter Name="IsPrimary" Type="String" />
            <asp:Parameter Name="IsPrimaryBilling" Type="String" />
            <asp:Parameter Name="IsPrimaryShipping" Type="String" />
            <asp:Parameter Name="RoleName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
