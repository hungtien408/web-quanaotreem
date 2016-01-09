<%@ Page Title="" Language="C#" MasterPageFile="~/site-right.master" AutoEventWireup="true" CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="san-pham-mau.aspx">Sản phẩm</a>&raquo;
    <span>Bộ bé gái 8 ri</span>
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
        <div class="detail-content">
            <h1 class="product-name">Gác chân sau Rizoma</h1>
            <div class="product-code">Mã SP: <strong>BT0012</strong></div>
            <div class="face-like">
                <img src="assets/images/face-like.gif" alt="" />
            </div>
            <ul class="list-info">
                <li><span class="info-name">&bull; Chất liệu:</span> <strong>Jean</strong><div class="clr"></div>
                </li>
                <li><span class="info-name">&bull; Màu:</span>
                    <div id="colorN" class="wrap-color">
                        <a class="link-color" href="san-pham-color.aspx">
                            <img src="assets/images/color-img-1.gif" alt="" /></a>
                        <a class="link-color" href="san-pham-color.aspx">
                            <img src="assets/images/color-img-1.gif" alt="" /></a>
                        <a class="link-color" href="san-pham-color.aspx">
                            <img src="assets/images/color-img-1.gif" alt="" /></a>
                        <a class="link-color" href="san-pham-color.aspx">
                            <img src="assets/images/color-img-1.gif" alt="" /></a>
                        <a class="link-color" href="san-pham-color.aspx">
                            <img src="assets/images/color-img-1.gif" alt="" /></a>
                        <a class="link-color" href="san-pham-color.aspx">
                            <img src="assets/images/color-img-1.gif" alt="" /></a>

                    </div>
                    <div class="clr"></div>
                </li>
                <li>
                    <span class="info-name">&bull; Kích cỡ:</span>
                    <div class="select-box">
                        <asp:DropDownList ID="DropDownList1" CssClass="selectb" runat="server"></asp:DropDownList>
                    </div>
                    <div class="link-node"><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal">Bảng thông số size sản xuất <span class="fa fa-long-arrow-right"></span></a></div>
                    <div class="clr"></div>
                </li>
                <li><span class="info-name">&bull; Số lượng Sản Phẩm / Ri: </span><strong>8</strong>
                    <div class="clr"></div>
                </li>
            </ul>
            <div class="detail-btn">
            </div>
        </div>
    </div>
    <div class="head head-line">
        <h4 class="title">Hàng hot thị trường</h4>
    </div>
    <div class="row product-tb tb-center">
        <div class="col-xs-4 element-item">
            <div class="product-box">
                <a href="san-pham-chi-tiet.aspx" class="product-img corner">
                    <span class="fullbox-img boximg-in">
                        <img class="hideo" src="assets/images/product-img-1.jpg" alt="" /></span>
                </a>
                <div class="product-content">
                    <h4 class="product-name"><a href="san-pham-chi-tiet.aspx">Bộ bé gái 8 ri</a></h4>
                    <div class="pro-code">Mã: DBBT01</div>
                </div>
                <div class="product-btn">
                    <a href="#" class="like-link"><span class="fa fa-heart"></span></a>
                    <a href="#" class="cart-link"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></a>
                </div>
            </div>
        </div>
        <div class="col-xs-4 element-item">
            <div class="product-box">
                <a href="san-pham-chi-tiet.aspx" class="product-img corner">
                    <span class="fullbox-img boximg-in">
                        <img class="hideo" src="assets/images/product-img-1.jpg" alt="" /></span>
                </a>
                <div class="product-content">
                    <h4 class="product-name"><a href="san-pham-chi-tiet.aspx">Bộ bé gái 8 ri</a></h4>
                    <div class="pro-code">Mã: DBBT01</div>
                </div>
                <div class="product-btn">
                    <a href="#" class="like-link"><span class="fa fa-heart"></span></a>
                    <a href="#" class="cart-link"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></a>
                </div>
            </div>
        </div>
        <div class="col-xs-4 element-item">
            <div class="product-box">
                <a href="san-pham-chi-tiet.aspx" class="product-img corner">
                    <span class="fullbox-img boximg-in">
                        <img class="hideo" src="assets/images/product-img-1.jpg" alt="" /></span>
                </a>
                <div class="product-content">
                    <h4 class="product-name"><a href="san-pham-chi-tiet.aspx">Bộ bé gái 8 ri</a></h4>
                    <div class="pro-code">Mã: DBBT01</div>
                </div>
                <div class="product-btn">
                    <a href="#" class="like-link"><span class="fa fa-heart"></span></a>
                    <a href="#" class="cart-link"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></a>
                </div>
            </div>
        </div>
        <div class="col-xs-4 element-item">
            <div class="product-box">
                <a href="san-pham-chi-tiet.aspx" class="product-img corner">
                    <span class="fullbox-img boximg-in">
                        <img class="hideo" src="assets/images/product-img-1.jpg" alt="" /></span>
                </a>
                <div class="product-content">
                    <h4 class="product-name"><a href="san-pham-chi-tiet.aspx">Bộ bé gái 8 ri</a></h4>
                    <div class="pro-code">Mã: DBBT01</div>
                </div>
                <div class="product-btn">
                    <a href="#" class="like-link"><span class="fa fa-heart"></span></a>
                    <a href="#" class="cart-link"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></a>
                </div>
            </div>
        </div>
        <div class="col-xs-4 element-item">
            <div class="product-box">
                <a href="san-pham-chi-tiet.aspx" class="product-img corner">
                    <span class="fullbox-img boximg-in">
                        <img class="hideo" src="assets/images/product-img-1.jpg" alt="" /></span>
                </a>
                <div class="product-content">
                    <h4 class="product-name"><a href="san-pham-chi-tiet.aspx">Bộ bé gái 8 ri</a></h4>
                    <div class="pro-code">Mã: DBBT01</div>
                </div>
                <div class="product-btn">
                    <a href="#" class="like-link"><span class="fa fa-heart"></span></a>
                    <a href="#" class="cart-link"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></a>
                </div>
            </div>
        </div>
        <div class="col-xs-4 element-item">
            <div class="product-box">
                <a href="san-pham-chi-tiet.aspx" class="product-img corner">
                    <span class="fullbox-img boximg-in">
                        <img class="hideo" src="assets/images/product-img-1.jpg" alt="" /></span>
                </a>
                <div class="product-content">
                    <h4 class="product-name"><a href="san-pham-chi-tiet.aspx">Bộ bé gái 8 ri</a></h4>
                    <div class="pro-code">Mã: DBBT01</div>
                </div>
                <div class="product-btn">
                    <a href="#" class="like-link"><span class="fa fa-heart"></span></a>
                    <a href="#" class="cart-link"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></a>
                </div>
            </div>
        </div>
    </div>
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-uppercase" id="myModalLabel">bảng thông số size</h4>
                </div>
                <div class="modal-body">
                    <p>y styles for key aspects of the framework. With Bootstrap 3, we've rewritten the project to be mobile friendly from the start. Instead of adding on optional mobile styles, they're baked right into the core. In fact, Bootstrap is mobile first. Mobile first styles can be found throughout the entire libra</p>
                    <p>y styles for key aspects of the framework. With Bootstrap 3, we've rewritten the project to be mobile friendly from the start. Instead of adding on optional mobile styles, they're baked right into the core. In fact, Bootstrap is mobile first. Mobile first styles can be found throughout the entire libra</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

