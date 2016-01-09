<%@ Page Title="" Language="C#" MasterPageFile="~/site-support.master" AutoEventWireup="true" CodeFile="ho-tro-khach-hang.aspx.cs" Inherits="ho_tro_khach_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSite" Runat="Server">
    <span>Thông tin về chúng tôi</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphAside" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="head desktop-992">
        <h4 class="title-d">Thông tin về chúng tôi</h4>
    </div>
   <h4 class="title-list mobile-992"><a class="panel-a" href="#mobileRight"  data-position="false" data-type="false">Thông tin về chúng tôi<span class="icona glyphicon glyphicon-chevron-down"></span></a></h4>
   <asp:ListView ID="lstVeChungToi" runat="server" DataSourceID="odsVeChungToi"
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
    <asp:ObjectDataSource ID="odsVeChungToi" runat="server" 
        SelectMethod="ArticleSelectAll" TypeName="TLLib.Article">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ArticleTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DefaultValue="3" Name="ArticleCategoryID" Type="String" />
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

