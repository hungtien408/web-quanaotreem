<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/site-right.master"
    AutoEventWireup="true" CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="san-pham.aspx">Sản phẩm</a>&raquo; <span>
        <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-details">
        <div id="detais-image" class="details-img">
            <%--<div id="jcarouselDetails" class="connected-carousels">
                <div id="detailsa">
                    <div class="zoom-box">
                        <a id="zoom1" href="assets/images/detail-big-2.jpg" class="cloud-zoom" rel="showTitle: false, zoomWidth: '340', adjustY:0, adjustX:5">
                            <img class="img-responsive" src="assets/images/detail-img-2.jpg" alt="" />
                        </a>
                    </div>
                </div>
                <div id="detailsb">
                    <div class="stage">
                        <div class="carousel carousel-stage">
                            <ul>
                                <li>
                                    <img src="assets/images/detail-img-1.jpg" alt=""></li>
                                <li>
                                    <img src="assets/images/detail-img-2.jpg" alt=""></li>
                                <li>
                                    <img src="assets/images/detail-img-3.jpg" alt=""></li>
                                <li>
                                    <img src="assets/images/detail-img-4.jpg" alt=""></li>
                                <li>
                                    <img src="assets/images/detail-img-5.jpg" alt=""></li>
                                <li>
                                    <img src="assets/images/detail-img-6.jpg" alt=""></li>
                            </ul>
                        </div>
                        <a href="#" class="prev prev-stage"><span class="icon-chevron-left corner"></span></a>
                        <a href="#" class="next next-stage"><span class="icon-chevron-right corner"></span></a>
                    </div>

                </div>
                <div class="navigation">
                    <a href="#" class="prev prev-navigation navigation-btn"><span class="fa fa-angle-left corner"></span></a>
                    <a href="#" class="next next-navigation navigation-btn"><span class="fa fa-angle-right corner"></span></a>
                    <div class="carousel carousel-navigation">

                        <ul>
                            <li>
                                <div class="small-in">
                                    <a href='assets/images/detail-big-1.jpg' data-img='assets/images/detail-img-1.jpg' class='cloud-zoom-gallery small-img' title='Thumbnail 1'
                                        rel="useZoom: 'zoom1', smallImage: 'assets/images/detail-img-1.jpg' ">
                                        <img class="img-responsive" src="assets/images/detail-small-1.jpg" alt="Thumbnail 1" />
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="small-in">
                                    <a href='assets/images/detail-big-2.jpg' data-img='assets/images/detail-img-2.jpg' class='cloud-zoom-gallery small-img' title='Thumbnail 1'
                                        rel="useZoom: 'zoom1', smallImage: 'assets/images/detail-img-2.jpg' ">
                                        <img class="img-responsive" src="assets/images/detail-small-2.jpg" alt="Thumbnail 1" />
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="small-in">
                                    <a href='assets/images/detail-big-3.jpg' data-img='assets/images/detail-img-3.jpg' class='cloud-zoom-gallery small-img' title='Thumbnail 1'
                                        rel="useZoom: 'zoom1', smallImage: 'assets/images/detail-img-3.jpg' ">
                                        <img class="img-responsive" src="assets/images/detail-small-3.jpg" alt="Thumbnail 1" />
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="small-in">
                                    <a href='assets/images/detail-big-4.jpg' data-img='assets/images/detail-img-4.jpg' class='cloud-zoom-gallery small-img' title='Thumbnail 1'
                                        rel="useZoom: 'zoom1', smallImage: 'assets/images/detail-img-4.jpg' ">
                                        <img class="img-responsive" src="assets/images/detail-small-4.jpg" alt="Thumbnail 1" />
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="small-in">
                                    <a href='assets/images/detail-big-5.jpg' data-img='assets/images/detail-img-5.jpg' class='cloud-zoom-gallery small-img' title='Thumbnail 1'
                                        rel="useZoom: 'zoom1', smallImage: 'assets/images/detail-img-5.jpg' ">
                                        <img class="img-responsive" src="assets/images/detail-small-5.jpg" alt="Thumbnail 1" />
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="small-in">
                                    <a href='assets/images/detail-big-6.jpg' data-img='assets/images/detail-img-6.jpg' class='cloud-zoom-gallery small-img' title='Thumbnail 1'
                                        rel="useZoom: 'zoom1', smallImage: 'assets/images/detail-img-6.jpg' ">
                                        <img class="img-responsive" src="assets/images/detail-small-6.jpg" alt="Thumbnail 1" />
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>--%>
        </div>
        <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="detail-content">
                    <h1 class="product-name">
                        <%# Eval("ProductName") %></h1>
                    <div class="product-code">
                        Mã SP: <strong>
                            <%# Eval("Tag") %></strong></div>
                    <div class="face-like">
                        <img src="assets/images/face-like.gif" alt="" />
                    </div>
                    <ul class="list-info">
                        <li><span class="info-name">&bull; Chất liệu:</span> <strong>
                            <%# Eval("ChatLieu") %></strong><div class="clr">
                            </div>
                        </li>
                        <li><span class="info-name">&bull; Màu:</span>
                            <asp:ListView ID="lstColor" runat="server" DataSourceID="odsColor" EnableModelValidation="True">
                                <ItemTemplate>
                                    <a productcolorid='<%# Eval("ProductOptionCategoryID") %>' productcolorname='<%# Eval("ProductOptionCategoryName") %>'
                                        class="link-color" href='<%# progressTitle(Eval("ProductOptionCategoryName")) + "-po-" + Eval("ProductOptionCategoryID") + ".aspx" %>'>
                                        <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/productoptioncategory/" + Eval("ImageName") : "~/assets/images/color-img-1.gif" %>'
                                            runat="server" /></a>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="colorN" class="wrap-color">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsColor" runat="server" SelectMethod="ProductOptionCategorySelectAll1"
                                TypeName="TLLib.ProductOptionCategory">
                                <SelectParameters>
                                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                    <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <div class="clr">
                            </div>
                        </li>
                        <li><span class="info-name">&bull; Kích cỡ:</span>
                            <div class="select-box">
                                <asp:DropDownList ID="ddlProductLength" CssClass="selectb" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="link-node">
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal">Bảng thông
                                    số size sản xuất <span class="fa fa-long-arrow-right"></span></a>
                            </div>
                            <div class="clr">
                            </div>
                        </li>
                        <li><span class="info-name">&bull; Số lượng Sản Phẩm / Ri: </span><strong>
                            <%# Eval("Ri") %></strong>
                            <div class="clr">
                            </div>
                        </li>
                    </ul>
                    <div class="detail-btn">
                    </div>
                </div>
                <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div class="head head-line">
        <h4 class="title">
            Hàng hot thị trường</h4>
    </div>
    <asp:ListView ID="lstProductHot" runat="server" DataSourceID="odsProductHot" EnableModelValidation="True"
        OnItemCommand="lstProductHot_ItemCommand">
        <ItemTemplate>
            <div class="col-xs-4 element-item">
                <div class="product-box">
                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                        class="product-img corner"><span class="fullbox-img boximg-in">
                            <img id="Img1" class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                runat="server" /></span> </a>
                    <div class="product-content">
                        <h4 class="product-name">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                <%# Eval("ProductName") %></a></h4>
                        <div class="pro-code">
                            Mã:
                            <%# Eval("Tag") %></div>
                    </div>
                    <asp:HiddenField ID="hdnProductOptionCategoryID" runat="server" />
                    <asp:HiddenField ID="hdnProductOptionCategoryName" runat="server" />
                    <asp:HiddenField ID="hdnProductLengthID" runat="server" />
                    <asp:HiddenField ID="hdnProductLengthName" runat="server" />
                    <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                    <asp:HiddenField ID="hdnImageName" Value='<%# Eval("ImageName") %>' runat="server" />
                    <asp:HiddenField ID="hdnProductCode" Value='<%# Eval("Tag") %>' runat="server" />
                    <asp:HiddenField ID="hdnProductCategory" Value='<%# Eval("CategoryID") %>' runat="server" />
                    <asp:HiddenField ID="hdnPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                        runat="server" />
                    <asp:Label ID="lblProductName" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    <asp:Label ID="lblProductNameEn" Visible="False" runat="server" Text='<%# Eval("ProductNameEn") %>'></asp:Label>
                    <div class="product-btn">
                        <asp:LinkButton ID="lkbWishList2" CssClass="like-link" CommandName="AddToWishList"
                            runat="server"><span class="fa fa-heart"></span></asp:LinkButton>
                        <asp:LinkButton ID="lkbAddToCart" runat="server" CssClass="cart-link" CommandName="AddToCart"
                            ValidationGroup="cart"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></asp:LinkButton>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="row product-tb tb-center">
                <span runat="server" id="itemPlaceholder" />
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsProductHot" runat="server" SelectMethod="ProductSelectAll"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:Parameter Name="StartRowIndex" Type="String" />
            <asp:Parameter Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="PriceFrom" Type="String" />
            <asp:Parameter Name="PriceTo" Type="String" />
            <asp:QueryStringParameter Name="CategoryID" QueryStringField="pci" Type="String" />
            <asp:Parameter Name="ManufacturerID" Type="String" />
            <asp:Parameter Name="OriginID" Type="String" />
            <asp:Parameter Name="Tag" Type="String" />
            <asp:Parameter Name="InStock" Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
            <asp:Parameter Name="IsNew" Type="String" />
            <asp:Parameter Name="IsBestSeller" Type="String" />
            <asp:Parameter Name="IsSaleOff" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="FromDate" Type="String" />
            <asp:Parameter Name="ToDate" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-uppercase" id="myModalLabel">
                        bảng thông số size</h4>
                </div>
                <asp:ListView ID="lstThongSoSize" runat="server" DataSourceID="odsProductDetails2"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="modal-body">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ThongSoSize") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductDetails2" runat="server" SelectMethod="ProductSelectOne"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
