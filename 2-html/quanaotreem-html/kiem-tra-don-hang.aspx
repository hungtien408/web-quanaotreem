<%@ Page Title="" Language="C#" MasterPageFile="~/site-account.master" AutoEventWireup="true" CodeFile="kiem-tra-don-hang.aspx.cs" Inherits="kiem_tra_don_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSite" Runat="Server">
        <span>Kiểm tra đơn hàng</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="title-d desktop-992 mbp10">Đặt hàng/Lịch sử thanh toán</h1>
    <h2 class="title-list mbp10 mobile-992"><a class="panel-a" href="#mobileRight"  data-position="false" data-type="false">Kiểm tra đơn hàng<span class="icona glyphicon glyphicon-chevron-down"></span></a></h2>
    <div class="table-responsive">
        <table class="tb-account table" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th class="col-1">ID</th>
                    <th class="col-2">Chi tiết đơn hàng</th>
                    <th class="col-3">Ngày mua</th>
                    <th class="col-4">Địa chỉ giao hàng</th>
                    <th class="col-5">Hình thức thanh toán</th>
                    <th class="col-6">Tình trạng đơn hàng</th>
                    <th class="col-7">Tổng tiền</th>
                    <th class="col-8"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="col-1">010115</td>
                    <td class="col-2"><strong>Miss Dior Le Parfum</strong></td>
                    <td class="col-3">01/01/2015<br />02:35:30 PM</td>
                    <td class="col-4">32 Lê Lai, Quận 1, TP. Hồ Chí Minh, Việt Nam</td>
                    <td class="col-5">
                        Thanh toán bằng:<br />Chuyển khoản trực tiếp<br /><span class="tred">Đang chờ xử lý</span>
                    </td>
                    <td class="col-6">Chưa vận chuyển</td>
                    <td class="col-7">620.000 đ</td>
                    <td class="col-8"><a class="delete" href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
                <tr>
                    <td class="col-1">010115</td>
                    <td class="col-2"><strong>Miss Dior Le Parfum</strong></td>
                    <td class="col-3">01/01/2015<br />02:35:30 PM</td>
                    <td class="col-4">32 Lê Lai, Quận 1, TP. Hồ Chí Minh, Việt Nam</td>
                    <td class="col-5">
                        Thanh toán bằng:<br />Chuyển khoản trực tiếp<br /><span class="tred">Đang chờ xử lý</span>
                    </td>
                    <td class="col-6">Chưa vận chuyển</td>
                    <td class="col-7">620.000 đ</td>
                    <td class="col-8"><a class="delete" href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>

