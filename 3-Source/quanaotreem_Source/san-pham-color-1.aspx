﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="san-pham-color-1.aspx.cs" Inherits="san_pham_color" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ListView ID="lstColor" runat="server" DataSourceID="odsColor1" EnableModelValidation="True">
        <ItemTemplate>
            <asp:Label ID="lblProductOptionCategoryID" runat="server" Text='<%# Eval("ProductOptionCategoryID") %>'></asp:Label>
            <div id="jcarouselDetails" class="connected-carousels">
                <div id="detailsa">
                    <asp:ListView ID="lstColor1" runat="server" DataSourceID="odsColor1" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="zoom-box">
                                <a id="zoom1" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/" + Eval("ImageName") : "../assets/images/detail-big-2.jpg" %>'
                                    class="cloud-zoom" rel="showTitle: false, zoomWidth: '340', adjustY:0, adjustX:5">
                                    <img class="img-responsive" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/thumbs/" + Eval("ImageName") : "" %>'
                                        alt="" />
                                </a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
                <div id="detailsb">
                    <div class="stage">
                        <div class="carousel carousel-stage">
                            <asp:ListView ID="lstColor2" runat="server" DataSourceID="odsColor2" EnableModelValidation="True">
                                <ItemTemplate>
                                    <li>
                                        <img id="Img1" runat="server" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/thumbs/" + Eval("ImageName") : "" %>'
                                            alt='<%# Eval("ImageName") %>' /></li>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <ul>
                                        <li runat="server" id="itemPlaceholder"></li>
                                    </ul>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <a href="#" class="prev prev-stage"><span class="icon-chevron-left corner"></span>
                        </a><a href="#" class="next next-stage"><span class="icon-chevron-right corner"></span>
                        </a>
                    </div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev prev-navigation navigation-btn"><span class="fa fa-angle-left corner">
                    </span></a><a href="#" class="next next-navigation navigation-btn"><span class="fa fa-angle-right corner">
                    </span></a>
                    <div class="carousel carousel-navigation">
                        <asp:ListView ID="lstColor3" runat="server" DataSourceID="odsColor2" EnableModelValidation="True">
                            <ItemTemplate>
                                <li>
                                    <div class="small-in">
                                        <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/" + Eval("ImageName") : "../assets/images/detail-big-1.jpg" %>'
                                            data-img='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/thumbs/" + Eval("ImageName") : "" %>'
                                            class='cloud-zoom-gallery small-img' title='Thumbnail 1' rel="useZoom: 'zoom1', smallImage: '<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/thumbs/" + Eval("ImageName") : "" %>' ">
                                            <img class="img-responsive" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/thumbs/" + Eval("ImageName") : "" %>'
                                                alt="Thumbnail 1" />
                                        </a>
                                    </div>
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul>
                                    <li runat="server" id="itemPlaceholder"></li>
                                </ul>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
            <asp:ObjectDataSource ID="odsColor2" runat="server" SelectMethod="ProductOptionSelectAll"
                TypeName="TLLib.ProductOption">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProductOptionTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:ControlParameter ControlID="lblProductOptionCategoryID" Name="ProductOptionCategoryID"
                        PropertyName="Text" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsColor1" runat="server" SelectMethod="ProductOptionSelectAll"
        TypeName="TLLib.ProductOption">
        <SelectParameters>
            <asp:Parameter Name="StartRowIndex" Type="String" />
            <asp:Parameter Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProductOptionTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:QueryStringParameter Name="ProductOptionCategoryID" QueryStringField="po" 
                Type="String" />
            <asp:Parameter Name="Tag" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsHot" Type="String" />
            <asp:Parameter Name="IsNew" Type="String" />
            <asp:Parameter Name="FromDate" Type="String" />
            <asp:Parameter Name="ToDate" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
