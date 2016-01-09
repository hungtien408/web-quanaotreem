<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="gio-hang.aspx.cs" Inherits="gio_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Giỏ hàng</title>
    <meta name="description" content="Giỏ hàng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~" runat="server"><span class="fa fa-home"></span></a>&raquo; <span>
                Giỏ hàng</span>
        </div>
        <div class="wrapper-cart">
            <ul id="menu-control">
                <li class="active">
                    <div class="box-me corner">
                        <div class="me-name">
                            Giỏ hàng</div>
                    </div>
                </li>
                <li>
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
                <div class="cart-content">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="odsCart" EnableModelValidation="True"
                                OnItemCommand="ListView1_ItemCommand" OnDataBound="ListView1_DataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td class="col-1">
                                            <h2 class="title-moh">
                                                Sản phẩm</h2>
                                            <div class="cart-img">
                                                <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                                    runat="server" /></div>
                                        </td>
                                        <td class="col-2">
                                            <h3 class="product-name">
                                                <%# Eval("ProductName") %>
                                                <span>
                                                    <%# Eval("Tag") %><%# " - " + Eval("ProductOptionCategoryName") %></span></h3>
                                        </td>
                                        <td class="col-3">
                                            <div class="price">
                                                <asp:HiddenField ID="hdnCartProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnCartProductOptionCategoryID" Value='<%# Eval("ProductOptionCategoryID") %>'
                                                    runat="server" />
                                                <asp:HiddenField ID="hdnCartProductLengthID" Value='<%# Eval("ProductLengthID") %>'
                                                    runat="server" />
                                                <asp:HiddenField ID="hdnCartPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                                    runat="server" />
                                                <span class="title-mo">Giá</span><%#string.Format("{0:##,###.##}", Eval("Price")).Replace('.', 
'*').Replace(',', '.').Replace('*', ',')%>
                                            </div>
                                        </td>
                                        <td class="col-4">
                                            <span class="title-mo">Số lượng</span>
                                            <div class="select-wrap">
                                                <asp:TextBox ID="txtQuantity" CssClass="text-num" runat="server" Text='<%# Eval("Quantity") %>'
                                                    OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                                            </div>
                                            <div class="clr">
                                            </div>
                                        </td>
                                        <td class="col-5">
                                            <div class="price">
                                                <span class="title-mo">Thành tiền</span><asp:Label ID="lblProductPrice" runat="server">
                                            <%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "<strong>0</strong> vnđ" : "<strong>" + (string.Format("{0:##,###.##}", Convert.ToInt16(string.IsNullOrEmpty(Eval("Quantity").ToString()) ? 0 : Eval("Quantity")) * Convert.ToDouble(string.IsNullOrEmpty(Eval("Price").ToString()) ? 0 : Eval("Price"))).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> vnđ"%>
                                                </asp:Label></div>
                                        </td>
                                        <td class="col-6">
                                            <asp:LinkButton CssClass="delete" CommandName="Remove" OnClientClick="return confirm('Bạn muốn xóa sản phẩm này?')"
                                                ID="lkbRemove" runat="server"><span class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <div class="note">
                                        Chưa có sản phẩm trong giỏ hàng của bạn! <a href="san-pham.aspx">Mua sản phẩm</a>.
                                    </div>
                                </EmptyDataTemplate>
                                <LayoutTemplate>
                                    <table class="tb-cart" cellpadding="0" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th class="col-1">
                                                    Sản phẩm
                                                </th>
                                                <th class="col-2">
                                                </th>
                                                <th class="col-3">
                                                    Giá
                                                </th>
                                                <th class="col-4">
                                                    Số lượng
                                                </th>
                                                <th class="col-5">
                                                    Thành tiền
                                                </th>
                                                <th class="col-6">
                                                    Hủy
                                                </th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <td colspan="2" class="col-1 hide-mo">
                                                </td>
                                                <td colspan="4" class="col-2">
                                                    <div class="box-price">
                                                        <span>thành tiền</span> <span class="price"><strong>
                                                            <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                                                            <asp:HiddenField ID="hdnTotalPrice" runat="server" />
                                                        </strong>vnđ</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <div class="box-price">
                                                        <span>phí vận chuyển</span> <span class="price"><strong>
                                                            <asp:Label ID="lblShippingPrice" runat="server">
                                                            </asp:Label>
                                                            <asp:HiddenField ID="hdnShippingPrice" runat="server" />
                                                        </strong>vnđ</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <div class="box-price">
                                                        <span>tổng tiền</span> <span class="price"><strong>
                                                            <asp:Label ID="lblSumTotalPrice" runat="server"></asp:Label>
                                                            <asp:HiddenField ID="hdnSumTotalPrice" runat="server" />
                                                        </strong>vnđ</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <span runat="server" id="itemPlaceholder"></span>
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart">
                            </asp:ObjectDataSource>
                            <asp:Panel ID="pnlbutton" Visible="False" class="btn-app" runat="server">
                                <div class="wrap-btn text-center">
                                    <a class="btn-a" href="san-pham.aspx">chọn thêm sản phẩm</a>
                                    <asp:LinkButton ID="lkbUpdate" class="btn-a" runat="server" OnClick="lkbUpdate_Click" ValidationGroup="ShoppingCart1">Thanh toán</asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
