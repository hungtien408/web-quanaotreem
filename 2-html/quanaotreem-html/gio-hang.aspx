<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="gio-hang.aspx.cs" Inherits="gio_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Giỏ hàng</title>
    <meta name="description" content="Giỏ hàng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~" runat="server"><span class="fa fa-home"></span></a>&raquo;
            <span>Giỏ hàng</span>
        </div>
    <div class="wrapper-cart">
            <ul id="menu-control">
                <li class="active">
                    <div class="box-me corner">
                        <div class="me-name">Giỏ hàng</div> 
                    </div>
                </li>
                <li>
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
             <div class="cart-content">
                 <table class="tb-cart" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th class="col-1">Sản phẩm</th>
                            <th class="col-2"></th>
                            <th class="col-3">Giá</th>
                            <th class="col-4">Số lượng</th>
                            <th class="col-5">Thành tiền</th>
                            <th class="col-6">Hủy</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="2" class="col-1 hide-mo">
                            </td>
                            <td colspan="4" class="col-2">
                                <div class="box-price">
                                    <span>
                                        thành tiền</span>
                                    <span class="price">
                                        <strong>285.000</strong>vnđ</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="box-price">
                                <span>
                                    phí vận chuyển</span>
                                <span class="price">
                                    <strong>20.000</strong>vnđ</span>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="box-price">
                                <span>
                                    tổng tiền</span>
                                <span class="price">
                                    <strong>285.000</strong>vnđ</span>
                                    </div>
                            </td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td class="col-1">
                                <h2 class="title-moh">Sản phẩm</h2>
                                <div class="cart-img">
                                    <img src="assets/images/product-img-1.jpg" alt="" /></div>
                            </td>
                            <td class="col-2">
                                <h3 class="product-name">Sed ut perspiciatis unde omnis  <span>GB7R18 - IV</span></h3>
                            </td>
                            <td class="col-3">
                                <div class="price"><span class="title-mo">Giá</span>285.000 vnđ</div>
                            </td>
                            <td class="col-4">
                                <span class="title-mo">Số lượng</span>
                                <div class="select-wrap">
                                    <asp:TextBox ID="TextBox3" CssClass="text-num" runat="server" Text="1"></asp:TextBox>
                                </div>
                                <div class="clr"></div>
                            </td>
                            <td class="col-5">
                                <div class="price"><span class="title-mo">Thành tiền</span>285.000 vnđ</div>
                            </td>
                            <td class="col-6">
                                <a href="#" class="delete"><span class="glyphicon glyphicon-remove-circle"></span></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-1">
                                <h2 class="title-moh">Sản phẩm</h2>
                                <div class="cart-img">
                                    <img src="assets/images/product-img-1.jpg" alt="" /></div>
                            </td>
                            <td class="col-2">
                                <h3 class="product-name">Sed ut perspiciatis unde omnis  <span>GB7R18 - IV</span></h3>
                            </td>
                            <td class="col-3">
                                <div class="price"><span class="title-mo">Giá</span>285.000 vnđ</div>
                            </td>
                            <td class="col-4">
                                <span class="title-mo">Số lượng</span>
                                <div class="select-wrap">
                                    <asp:TextBox ID="TextBox1" CssClass="text-num" runat="server" Text="1"></asp:TextBox>
                                </div>
                                <div class="clr"></div>
                            </td>
                            <td class="col-5">
                                <div class="price"><span class="title-mo">Thành tiền</span>285.000 vnđ</div>
                            </td>
                            <td class="col-6">
                                <a href="#" class="delete"><span class="glyphicon glyphicon-remove-circle"></span></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-1">
                                <h2 class="title-moh">Sản phẩm</h2>
                                <div class="cart-img">
                                    <img src="assets/images/product-img-1.jpg" alt="" /></div>
                            </td>
                            <td class="col-2">
                                <h3 class="product-name">Sed ut perspiciatis unde omnis  <span>GB7R18 - IV</span></h3>
                            </td>
                            <td class="col-3">
                                <div class="price"><span class="title-mo">Giá</span>285.000 vnđ</div>
                            </td>
                            <td class="col-4">
                                <span class="title-mo">Số lượng</span>
                                <div class="select-wrap">
                                    <asp:TextBox ID="TextBox2" CssClass="text-num" runat="server" Text="1"></asp:TextBox>
                                </div>
                                <div class="clr"></div>
                            </td>
                            <td class="col-5">
                                <div class="price"><span class="title-mo">Thành tiền</span>285.000 vnđ</div>
                            </td>
                            <td class="col-6">
                                <a href="#" class="delete"><span class="glyphicon glyphicon-remove-circle"></span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                 <div class="wrap-btn text-center">                     
                    <a class="btn-a" href="san-pham.aspx">chọn thêm sản phẩm</a>
                    <asp:LinkButton ID="LinkButton1" class="btn-a" runat="server">Thanh toán</asp:LinkButton>
                 </div>
             </div>
        </div>
        <div class="clr"></div>
    </div>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
