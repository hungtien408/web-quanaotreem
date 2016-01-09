<%@ Page Title="" Language="C#" MasterPageFile="~/site-support-sub.master" AutoEventWireup="true"
    CodeFile="tu-van-chi-tiet.aspx.cs" Inherits="tu_van_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="tu-van.aspx">Tứ vấn</a>&raquo; <span>
        <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title-d">
        <asp:Label ID="lblTitle2" runat="server" Text="Label"></asp:Label></h1>
    <div class="facebooks">
        <img src="assets/images/face-like.gif" alt="" />
    </div>
    <asp:ListView ID="lstTuVanDetails" runat="server" DataSourceID="odsTuVanDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="wrapper-text">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsTuVanDetails" runat="server" 
        SelectMethod="ArticleSelectOne" TypeName="TLLib.Article">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="tv" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
