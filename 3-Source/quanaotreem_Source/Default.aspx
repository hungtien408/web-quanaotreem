<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="banner">
        <div class="bmask-left">
        </div>
        <div class="bmask-right">
        </div>
        <div class="slider-wrapper">
            <div id="slider" class="nivoSlider">
                <asp:ListView ID="lstBanner" runat="server" DataSourceID="odsBanner" EnableModelValidation="True">
                    <ItemTemplate>
                        <img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/banner-img-1.jpg" %>'
                            runat="server" />
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="AdsBannerSelectAll"
                    TypeName="TLLib.AdsBanner">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="Website" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="wrapper-tabs">
            <div class="head head-line desktop-showhide">
                <ul class="control-tabs control-title">
                    <li><a href="#tabs-1" class="text-uppercase corner">Mẫu mới</a></li>
                    <li><a href="#tabs-2" class="text-uppercase corner">hàng hot thị trường</a></li>
                </ul>
                <a href="san-pham.aspx" class="more-all text-uppercase">xem tất cả</a>
            </div>
            <div class="tabs-content">
                <div class="tabs-group">
                    <h4 class="tabs-link mobile-showhide">
                        <a href="#tabs-1" class="text-uppercase">Mẫu mới<span class="glyphicon glyphicon-chevron-up"></span><span
                            class="glyphicon glyphicon-chevron-down"></span></a></h4>
                    <div id="tabs-1" class="tabs-box">
                        <asp:ListView ID="lstProductNew" runat="server" DataSourceID="odsProductNew" EnableModelValidation="True"
                            OnItemCommand="lstProductNew_ItemCommand">
                            <ItemTemplate>
                                <div class="col-md-3 col-xs-4 element-item">
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
                                            <asp:LinkButton ID="lkbWishList" CssClass="like-link" CommandName="AddToWishList"
                                                runat="server"><span class="fa fa-heart"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lkbAddToCart" runat="server" CssClass="cart-link" CommandName="AddToCart"
                                                ValidationGroup="cart"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="row product-tb tb-last tb-center" data-num="6">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsProductNew" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="8" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter Name="CategoryID" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter Name="IsHot" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsNew" Type="String" />
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
                    </div>
                </div>
                <div class="tabs-group">
                    <h4 class="tabs-link mobile-showhide">
                        <a href="#tabs-2" class="text-uppercase">hàng hot thị trường<span class="glyphicon glyphicon-chevron-up"></span><span
                            class="glyphicon glyphicon-chevron-down"></span></a></h4>
                    <div id="tabs-2" class="tabs-box">
                        <asp:ListView ID="lstProductHot" runat="server" DataSourceID="odsProductHot" EnableModelValidation="True"
                            OnItemCommand="lstProductHot_ItemCommand">
                            <ItemTemplate>
                                <div class="col-md-3 col-xs-4 element-item">
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
                                        <asp:HiddenField ID="hdnProductOptionCategoryID2" runat="server" />
                                        <asp:HiddenField ID="hdnProductOptionCategoryName2" runat="server" />
                                        <asp:HiddenField ID="hdnProductLengthID2" runat="server" />
                                        <asp:HiddenField ID="hdnProductLengthName2" runat="server" />
                                        <asp:HiddenField ID="hdnProductID2" Value='<%# Eval("ProductID") %>' runat="server" />
                                        <asp:HiddenField ID="hdnImageName2" Value='<%# Eval("ImageName") %>' runat="server" />
                                        <asp:HiddenField ID="hdnProductCode2" Value='<%# Eval("Tag") %>' runat="server" />
                                        <asp:HiddenField ID="hdnProductCategory2" Value='<%# Eval("CategoryID") %>' runat="server" />
                                        <asp:HiddenField ID="hdnPrice2" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                            runat="server" />
                                        <asp:Label ID="lblProductName2" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                        <asp:Label ID="lblProductNameEn2" Visible="False" runat="server" Text='<%# Eval("ProductNameEn") %>'></asp:Label>
                                        <div class="product-btn">
                                            <asp:LinkButton ID="lkbWishList2" CssClass="like-link" CommandName="AddToWishList"
                                                runat="server"><span class="fa fa-heart"></span></asp:LinkButton>
                                            <asp:LinkButton ID="lkbAddToCart2" runat="server" CssClass="cart-link" CommandName="AddToCart"
                                                ValidationGroup="cart"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="row product-tb tb-last tb-center" data-num="6">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsProductHot" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="8" Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:Parameter Name="CategoryID" Type="String" />
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
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper-tabs">
            <div class="head head-line">
                <h4 class="title corner text-uppercase">
                    quần áo bé trai</h4>
                <div class="control-tabs control-link desktop-showhide">
                    <asp:ListView ID="lstCategoryBoy" runat="server" DataSourceID="odsCategoryBoy" EnableModelValidation="True">
                        <ItemTemplate>
                            <a href='<%# "#tabsa-" + Eval("ProductCategoryID") %>' class="text-uppercase">
                                <%# Eval("ProductCategoryName") %></a>|
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsCategoryBoy" runat="server" SelectMethod="ProductCategorySelectAll"
                        TypeName="TLLib.ProductCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="tabs-content">
                <asp:ListView ID="lstProductCategoryBoy" runat="server" DataSourceID="odsCategoryBoy"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="tabs-group">
                            <h4 class="tabs-link tabs-la mobile-showhide">
                                <a href='<%# "#tabsa-" + Eval("ProductCategoryID") %>' class="text-uppercase">
                                    <%# Eval("ProductCategoryName") %><span class="glyphicon glyphicon-chevron-up"></span><span
                                        class="glyphicon glyphicon-chevron-down"></span></a></h4>
                            <div id='<%# "tabsa-" + Eval("ProductCategoryID") %>' class="tabs-box">
                                <asp:HiddenField ID="hdnProductCategoryBoy" runat="server" Value='<%# Eval("ProductCategoryID") %>' />
                                <asp:ListView ID="lstProductBoy" runat="server" DataSourceID="odsProductBoy" EnableModelValidation="True" OnItemCommand="lstProductBoy_ItemCommand">
                                    <ItemTemplate>
                                        <div class="col-md-3 col-xs-4 element-item">
                                            <div class="product-box">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                                    class="product-img corner"><span class="fullbox-img boximg-in">
                                                        <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                                            runat="server" /></span> </a>
                                                <div class="product-content">
                                                    <h4 class="product-name">
                                                        <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                            <%# Eval("ProductName") %></a></h4>
                                                    <div class="pro-code">
                                                        Mã:
                                                        <%# Eval("Tag") %></div>
                                                </div>
                                                <asp:HiddenField ID="hdnProductOptionCategoryID3" runat="server" />
                                                <asp:HiddenField ID="hdnProductOptionCategoryName3" runat="server" />
                                                <asp:HiddenField ID="hdnProductLengthID3" runat="server" />
                                                <asp:HiddenField ID="hdnProductLengthName3" runat="server" />
                                                <asp:HiddenField ID="hdnProductID3" Value='<%# Eval("ProductID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnImageName3" Value='<%# Eval("ImageName") %>' runat="server" />
                                                <asp:HiddenField ID="hdnProductCode3" Value='<%# Eval("Tag") %>' runat="server" />
                                                <asp:HiddenField ID="hdnProductCategory3" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnPrice3" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                                    runat="server" />
                                                <asp:Label ID="lblProductName3" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                                <asp:Label ID="lblProductNameEn3" Visible="False" runat="server" Text='<%# Eval("ProductNameEn") %>'></asp:Label>
                                                <div class="product-btn">
                                                    <asp:LinkButton ID="lkbWishList3" CssClass="like-link" CommandName="AddToWishList"
                                                        runat="server"><span class="fa fa-heart"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lkbAddToCart3" runat="server" CssClass="cart-link" CommandName="AddToCart"
                                                        ValidationGroup="cart"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="row product-tb tb-last tb-center" data-num="6">
                                            <span runat="server" id="itemPlaceholder" />
                                        </div>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductBoy" runat="server" SelectMethod="ProductSelectAll"
                                    TypeName="TLLib.Product">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                        <asp:Parameter DefaultValue="8" Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProductName" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="PriceFrom" Type="String" />
                                        <asp:Parameter Name="PriceTo" Type="String" />
                                        <asp:ControlParameter ControlID="hdnProductCategoryBoy" Name="CategoryID" PropertyName="Value"
                                            Type="String" />
                                        <asp:Parameter Name="ManufacturerID" Type="String" />
                                        <asp:Parameter Name="OriginID" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="InStock" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
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
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="wrapper-tabs">
            <div class="head head-line">
                <h4 class="title corner text-uppercase">
                    quần áo bé gái</h4>
                <div class="control-tabs control-link desktop-showhide">
                    <asp:ListView ID="lstCategoryGirl" runat="server" DataSourceID="odsCategoryGirl"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <a href='<%# "#tabsa-" + Eval("ProductCategoryID") %>' class="text-uppercase">
                                <%# Eval("ProductCategoryName") %></a>|
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsCategoryGirl" runat="server" SelectMethod="ProductCategorySelectAll"
                        TypeName="TLLib.ProductCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="tabs-content">
                <asp:ListView ID="lstProductCategoryGirl" runat="server" DataSourceID="odsCategoryGirl"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="tabs-group">
                            <h4 class="tabs-link tabs-la mobile-showhide">
                                <a href='<%# "#tabsa-" + Eval("ProductCategoryID") %>' class="text-uppercase">
                                    <%# Eval("ProductCategoryName") %><span class="glyphicon glyphicon-chevron-up"></span><span
                                        class="glyphicon glyphicon-chevron-down"></span></a></h4>
                            <div id='<%# "tabsa-" + Eval("ProductCategoryID") %>' class="tabs-box">
                                <asp:HiddenField ID="hdnProductCategoryBoy" runat="server" Value='<%# Eval("ProductCategoryID") %>' />
                                <asp:ListView ID="lstProductGirl" runat="server" DataSourceID="odsProductGirl" EnableModelValidation="True" OnItemCommand="lstProductGirl_ItemCommand">
                                    <ItemTemplate>
                                        <div class="col-md-3 col-xs-4 element-item">
                                            <div class="product-box">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                                    class="product-img corner"><span class="fullbox-img boximg-in">
                                                        <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                                            runat="server" /></span> </a>
                                                <div class="product-content">
                                                    <h4 class="product-name">
                                                        <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                            <%# Eval("ProductName") %></a></h4>
                                                    <div class="pro-code">
                                                        Mã:
                                                        <%# Eval("Tag") %></div>
                                                </div>
                                                <asp:HiddenField ID="hdnProductOptionCategoryID4" runat="server" />
                                                <asp:HiddenField ID="hdnProductOptionCategoryName4" runat="server" />
                                                <asp:HiddenField ID="hdnProductLengthID4" runat="server" />
                                                <asp:HiddenField ID="hdnProductLengthName4" runat="server" />
                                                <asp:HiddenField ID="hdnProductID4" Value='<%# Eval("ProductID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnImageName4" Value='<%# Eval("ImageName") %>' runat="server" />
                                                <asp:HiddenField ID="hdnProductCode4" Value='<%# Eval("Tag") %>' runat="server" />
                                                <asp:HiddenField ID="hdnProductCategory4" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnPrice4" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                                    runat="server" />
                                                <asp:Label ID="lblProductName4" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                                <asp:Label ID="lblProductNameEn4" Visible="False" runat="server" Text='<%# Eval("ProductNameEn") %>'></asp:Label>
                                                <div class="product-btn">
                                                    <asp:LinkButton ID="lkbWishList4" CssClass="like-link" CommandName="AddToWishList"
                                                        runat="server"><span class="fa fa-heart"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lkbAddToCart4" runat="server" CssClass="cart-link" CommandName="AddToCart"
                                                        ValidationGroup="cart"><span class="fa fa-shopping-cart"></span><span class="names">Đặt hàng</span></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="row product-tb tb-last tb-center" data-num="6">
                                            <span runat="server" id="itemPlaceholder" />
                                        </div>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsProductGirl" runat="server" SelectMethod="ProductSelectAll"
                                    TypeName="TLLib.Product">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                                        <asp:Parameter DefaultValue="8" Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProductName" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="PriceFrom" Type="String" />
                                        <asp:Parameter Name="PriceTo" Type="String" />
                                        <asp:ControlParameter ControlID="hdnProductCategoryBoy" Name="CategoryID" PropertyName="Value"
                                            Type="String" />
                                        <asp:Parameter Name="ManufacturerID" Type="String" />
                                        <asp:Parameter Name="OriginID" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="InStock" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
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
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="head head-line">
            <h4 class="text-uppercase title">
                Video</h4>
            <a href="video.aspx" class="more-all text-uppercase">xem tất cả</a>
        </div>
        <div class="wrapper-in">
            <div class="wrapper-10">
                <div class="jcarousel-wrapper list-video">
                    <div class="jcarousel">
                        <asp:ListView ID="lstVideo" runat="server" DataSourceID="odsVideo" EnableModelValidation="True">
                            <ItemTemplate>
                                <li>
                                    <div class="video-box">
                                        <a class="video-img" href="javascript:void(0);" data-toggle="modal" data-target="#popupvideo"
                                            data-video='<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "../res/video/" + Eval("VideoPath") %>'
                                            data-img='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-img-1.jpg" %>'>
                                            <img alt='<%# Eval("ImagePath") %>' src='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-aodai.jpg" %>'
                                                runat="server" />
                                            <span class="video-mask"><strong></strong></span></a>
                                        <h4 class="video-name">
                                            <a href='<%# progressTitle(Eval("Title")) + "-vi-" + Eval("VideoID") + ".aspx" %>'>
                                                <%# Eval("Title")%></a></h4>
                                    </div>
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul>
                                    <li runat="server" id="itemPlaceholder"></li>
                                </ul>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsVideo" runat="server" SelectMethod="VideoSelectAll"
                            TypeName="TLLib.Video">
                            <SelectParameters>
                                <asp:Parameter Name="Title" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="VideoCategoryID" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                    <a href="javascript:void(0)" class="prev jcarousel-prev navigation-btn">&lsaquo;</a>
                    <a href="javascript:void(0)" class="next jcarousel-next navigation-btn">&rsaquo;</a>
                </div>
            </div>
        </div>
        <div class="head head-line">
            <h4 class="title text-uppercase">
                Tư vấn</h4>
            <a href="tu-van.aspx" class="more-all text-uppercase">xem tất cả</a>
        </div>
        <asp:ListView ID="lstTuVan" runat="server" DataSourceID="odsTuVan" EnableModelValidation="True">
            <ItemTemplate>
                <div class="col-md-3 col-xs-4 element-item">
                    <div class="box-sup">
                        <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tv-" + Eval("ArticleID") + ".aspx" %>'
                            class="sup-img">
                            <img id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/img-1.jpg" %>'
                                runat="server" />
                        </a>
                        <h3 class="sup-name">
                            <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tv-" + Eval("ArticleID") + ".aspx" %>'>
                                <%# Eval("ArticleTitle") %></a>
                        </h3>
                        <div class="desciption">
                            <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 120) %>
                        </div>
                        <div class="more-detail">
                            <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tv-" + Eval("ArticleID") + ".aspx" %>'>
                                Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div class="support-tb wrap-support row tb-last" data-num="4">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsTuVan" runat="server" SelectMethod="ArticleSelectAll"
            TypeName="TLLib.Article">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                <asp:Parameter DefaultValue="4" Name="EndRowIndex" Type="String" />
                <asp:Parameter Name="Keyword" Type="String" />
                <asp:Parameter Name="ArticleTitle" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter DefaultValue="10" Name="ArticleCategoryID" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                <asp:Parameter Name="IsHot" Type="String" />
                <asp:Parameter Name="IsNew" Type="String" />
                <asp:Parameter Name="FromDate" Type="String" />
                <asp:Parameter Name="ToDate" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
    <div class="modal fade" id="popupvideo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-video">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            </button>
            <div class="modal-content">
                <div id="jwplayer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
