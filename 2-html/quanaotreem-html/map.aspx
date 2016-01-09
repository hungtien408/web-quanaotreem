<%@ Page Language="C#" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mapwrap">
            <i>Nhập đỉa chỉ của bạn bên dưới để tìm đường đi</i>
            <div class="search-map">
                <div class="search-text"><input id="start" type="text" value="48 Nguyễn Tuyển , Quận 2, Tp HCM" /></div>
                <input id="getdiretion" class="getdiretion" type="button" value="Tìm đường đi"/>
                <%--<input id="getdiretion" class="getdiretion" type="button" onclick="calcRoute();" value="Tìm đường đi"/>--%>
            </div>
            <div class="mapwrap">
                <div id="map">
                </div>
            </div>
            <div id="directionsPanel">
                <i>Kéo đường màu xanh trên bản đồ để thay đổi tuyến
                    đường</i>
            </div>
    </div>
    </form>
</body>
</html>
