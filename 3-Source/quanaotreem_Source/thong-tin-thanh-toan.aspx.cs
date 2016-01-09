using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;
using WebApplication2;

public partial class thong_tin_thanh_toan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                pnlInformationNoLogin.Visible = false;
                btnOrder.Visible = false;
                OdsAddressBook.SelectParameters["UserName"].DefaultValue = User.Identity.Name;
                if (Session["ShippingID"] == null)
                    OdsAddressBook.SelectParameters["IsPrimary"].DefaultValue = "True";
                //if (!User.Identity.IsAuthenticated)
                //    Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);
            }
            else if (Session["Email"] != null)
            {
                pnlInformationNoLogin.Visible = true;
                pnlInformationLogin.Visible = false;
                btnOrderLogin.Visible = false;
                txtEmail1.Text = Session["Email"].ToString();
                var strProvinceID = Session["ProvinceID"];
                if (strProvinceID != null)
                {
                    if (strProvinceID.ToString() != "1")
                        rbtMoneyShow.Visible = false;
                    else
                        rbtMoneyShow.Visible = true;
                    ddlProvince1.SelectedValue = strProvinceID.ToString();
                    OdsDistrict.SelectParameters["ProvinceIDs"].DefaultValue = ddlProvince1.SelectedValue;
                }
            }
            else
                Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);

            if (Session["Cart"] == null || (Session["Cart"] as DataTable).Rows.Count == 0)
                Response.Redirect("~/gio-hang.aspx");
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
        {
            var oShoppingCart = new ShoppingCart();
            var dt = oShoppingCart.Cart();
            if (dt.Rows.Count == 0)
            {
                lblCountProduct.Text = "0";
            }
            else
            {
                int quantity = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? "0" : dr["Quantity"]);
                    //var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    //Total += Quantity * Price;
                    quantity += Quantity;
                }
                lblCountProduct.Text = quantity.ToString();
                //lblTotalPrice.Text = string.Format("{0:##,###.##}", Total).Replace('.', '*').Replace(',', '.').Replace('*', ',');
            }
        }
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        var ProvinceID = FormView1.FindControl("hdnProvinceID") as HiddenField;
        var sProvinceID = Session["ProvinceID"] != null ? Session["ProvinceID"].ToString() : ProvinceID.Value;
        var ddlProvince = FormView1.FindControl("ddlProvince") as DropDownList;
        var DistrictID = FormView1.FindControl("hdnDistrictID") as HiddenField;
        var ddlDistrict = FormView1.FindControl("ddlDistrict") as DropDownList;
        if (Session["UserName"] != null || User.Identity.Name != null)
        {
            if (sProvinceID.ToString() != "1")
                rbtMoneyShow.Visible = false;
            else
                rbtMoneyShow.Visible = true;

            if (!string.IsNullOrEmpty(sProvinceID))
                ddlProvince.SelectedValue = sProvinceID;

            Session["ShippingID"] = FormView1.DataKey[0];
        }
    }

    protected void lstShoppingCart_DataBound(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            var lblTotalPrice = lstShoppingCart.FindControl("lblTotalPrice") as Label;
            var lblSumTotalPrice = lstShoppingCart.FindControl("lblSumTotalPrice") as Label;
            var hdnSumTotalPrice = lstShoppingCart.FindControl("hdnSumTotalPrice") as HiddenField;

            var lblShippingPrice = lstShoppingCart.FindControl("lblShippingPrice") as Label;
            var iShippingPrice = Session["ShippingPrice"] != null ? Session["ShippingPrice"] : 0;
            double TotalPrice = 0;
            double SumTotalPrice = 0;
            double ShippingPrice = 0;
            if (lblTotalPrice != null)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    TotalPrice += Quantity * Price;
                }
                ShippingPrice = Convert.ToDouble(iShippingPrice);
                SumTotalPrice = TotalPrice + ShippingPrice;
                hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                lblTotalPrice.Text = string.IsNullOrEmpty(TotalPrice.ToString()) ? "0 đ" : (string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ','));
                lblShippingPrice.Text = string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0 đ" : (string.Format("{0:##,###.##}", ShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ','));
                lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "0 đ" : (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ','));
            }
        }
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                var OrderNumber = DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);
                Session["OrderNumber"] = OrderNumber;
                double Amount = 0, sAmount = 0;
                string LastName,
                       FirstName,
                       Address,
                       Email,
                       Phone,
                       ProvinceCode,
                       DistrictName,
                       CountryName,
                       CountryID,
                       ProvinceID,
                       DistrictID,
                       AddressBookID,
                       strMessage;

                LastName = "";
                FirstName = txtFullName1.Text;
                Address = txtAddress1.Text;
                Email = txtEmail1.Text;
                Phone = txtPhone1.Text;
                ProvinceCode = ddlProvince1.SelectedItem.Text;
                ProvinceID = ddlProvince1.SelectedValue;
                CountryName = "Việt Nam";
                DistrictName = ddlDistrict1.SelectedItem.Text;
                DistrictID = ddlDistrict1.SelectedValue;
                CountryID = "1";
                strMessage = txtMessage1.Text;

                var oAddressBook1 = new AddressBook1();
                if (!string.IsNullOrEmpty(Email))
                {
                    var dvDuplicateEmail = oAddressBook1.AddressBook1SelectAll("", "", "", Email, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "").DefaultView;
                    if (dvDuplicateEmail.Count > 0)
                    {
                        AddressBookID = dvDuplicateEmail[0]["AddressBookID"].ToString();
                        oAddressBook1.AddressBook1Update(AddressBookID, FirstName, LastName, Email, Phone, "", "", "",
                                                         "", Address, "", "", "",
                                                         CountryID, ProvinceID, DistrictID, "True", "True", "True", "");
                    }
                    else
                        AddressBookID = oAddressBook1.AddressBook1Insert1(FirstName, LastName, Email, Phone, "", "", "", "", Address, "", "", "",
                                                  CountryID, ProvinceID, DistrictID, "True", "True", "True", "");
                }

                var ShippingPrice = Session["ShippingPrice"];
                var YourName = FirstName + " " + LastName;
                var YourAddress = Address + ", " + DistrictName + ", " + ProvinceCode + ", " + CountryName;

                var oOrders = new Orders();
                var oOrderDetail = new OrderDetail();
                var dtAddressBook = oAddressBook1.AddressBook1SelectAll("", "", "", Email, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "").DefaultView;
                if (dtAddressBook.Count > 0)
                    AddressBookID = dtAddressBook[0]["AddressBookID"].ToString();
                else
                    AddressBookID = "";

                var OrderID = Session["OrderNumber"].ToString();
                var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
                var OrderStatusID = "1";
                var ShippingStatusID = "1";
                var BillingAddressID = AddressBookID;
                var ShippingAddressID = AddressBookID;
                var Notes = txtMessage1.Text;
                var Comission = "";

                //var To = "sales@pandemos.vn";
                var To = "hungtien408@gmail.com";
                var Subject = "Chúng tôi đã nhận được đơn hàng: " + OrderID;
                //var Host = "118.69.199.203";
                //int Port = 25;
                var Host = "smtp.gmail.com";
                int Port = 587;
                var strDisplayNameMailFrom = "";
                var From = "webmastersendmail0401@gmail.com";
                var sPassword = "web123master";
                //var strDisplayNameMailFrom = "Pandemos - Đặt Hàng";
                //var From = "customerservice@pandemos.vn";
                //var sPassword = "pandemos@2014";
                bool bEnableSSL = true;

                if (rbtMoney.Checked)
                {
                    string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                    Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";

                    Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                    Body += "<p>Mã số đơn hàng của bạn là <b>" + OrderNumber + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. Để theo dõi đơn hàng, xin vui lòng vào mục <a style='font-size: 11px;' href='http://www.pandemos.vn/kiem-tra-don-hang.aspx'>theo dõi đơn hàng</a></p>";
                    //Body += "<p>Your order ID is <b>" + OrderNumber + "</b>. A summary of your order is shown below. To view the status of your order <a style='font-size: 11px;' href='http://www.pandemos.vn/theo-doi-don-hang.aspx'>click here.</a></p>";
                    Body += "</div>";
                    //Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p><p>Your order requires payment before it can be finalized. Please check our website for available methods</p></div>";
                    Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p></div>";
                    //Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người mua/Buyer</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + BuyerName + "</b></p><p>" + Address1 + "</p><p>" + DistrictName1 + "</p><p>" + ProvinceCode1 + "</p></div></td><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                    Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                    Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><h4 style='font-size: 18px;'>Chi tiết đơn hàng/Your Order Contains...</h4>";

                    Body += "<div style='font-size: 11px; font-family: Verdana'>";
                    //Body += "<p><b>* Hình thức giao hàng</b>: " + DeliveryMethodsEmail + "</p>";
                    //Body += "<p><b>* Hình thức thanh toán</b>:" + ServiceName + "</p>";
                    Body += "<p><b>* Phương thức thanh toán</b>: Tiền mặt</p>";
                    //Body += "<p><b>* Ngày - Giờ giao</b>: " + EmailDeliveryDate + "</p>";
                    Body += "</div>";

                    Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                    //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                    Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductCode = dr["Tag"].ToString();
                        //string ProductID = dr["ProductID"].ToString();
                        string ProductName = dr["ProductName"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                        var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                        Body += "<tr>";
                        Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + " - " + ProductLengthName + "</td>";
                        //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                        Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                        Body += "</tr>";
                    }
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    var iShippingPrice =
                        Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                    sAmount = Amount + iShippingPrice;
                    //sAmount = Amount;

                    var tAmount = string.Format("{0:##,###.##}", Amount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                    var Shipping = string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                    var SubTotal = string.Format("{0:##,###.##}", sAmount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";

                    Body += "<table style='font-size: 11px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                    Body += "<tr><td style='width:85%;'>Thành tiền/Subtotal:</td><td style='width:15%;'>" + tAmount + "</td></tr>";
                    Body += "<tr><td>Phí giao hàng/Shipping:</td><td>" + Shipping + "</td></tr>";
                    Body += "<tr><td><b>Tổng tiền/Grand Total:</b></td><td><b>" + SubTotal + "</b></td></tr>";
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    //Body += "<ul style='font-size: 11px; font-style: italic; padding: 0;margin: 0; list-style-type: none;'>";
                    //Body += "<li><b>*</b> Giá sản phẩm chưa bao gồm thuế VAT 10%/ Item price is excluded of 10% VAT</li>";
                    //Body += "<li><b>*</b> Xin vui lòng <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>gọi điện</a> tới Đồng Hồ Anh Minhs-Hoa Trái Cây để thay đổi nếu Quý khách muốn sửa đơn hàng/ Please <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>call</a> Đồng Hồ Anh Minhs-Hoa Trái Cây if you are in need of making a modification to your Order </li>";
                    //Body += "<li><b>*</b> Vui lòng tham khảo các điều khoản về Thay đổi và Hủy đơn hàng trong <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Thỏa Thuận Sử Dụng</a>/Please check Policy for Order Change and Cancelation in our <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Term of Use</a></li>";
                    //Body += "</ul>";
                    Body += "</div>";
                    Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                    Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                    Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>Pandemos</h4>";
                    Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                    Body += "<p>Add: 403, Hai Bà Trưng , P.8, Quận 3, HCM </p>";
                    Body += "<p>Tel: (08)3 820 8577 - Hotline: 0902 563 577 </p>";
                    //Body += "<p>M: +84 908 xxx xxx>";

                    Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                    Body += "<p>E: <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a></p>";
                    Body += "</div>";
                    Body += "</div>";
                    Body += "</div>";

                    var bSendEmail = Common.SendMail(Host, Port, From, sPassword, Email, To, Subject, Body, true);
                    if (bSendEmail)
                    {
                        var PaymentMethodID = "money";
                        oOrders.OrdersInsert1(
                            OrderID,
                            UserName,
                            OrderStatusID,
                            ShippingStatusID,
                            PaymentMethodID,
                            BillingAddressID,
                            ShippingAddressID,
                            Notes,
                            Comission,
                            "",
                            "",
                            YourAddress,
                            "",
                            Email
                            );
                        foreach (DataRow dr in dtCart.Rows)
                        {
                            string ProductID = dr["ProductID"].ToString();
                            string Quantity = dr["Quantity"].ToString();
                            string Price = dr["Price"].ToString();
                            string CreateBy = UserName;
                            string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                            string ProductLengthName = dr["ProductLengthName"].ToString();
                            //string ProductName = dr["ProductName"].ToString();
                            //string Type = dr["Tag"].ToString();
                            //string Description = dr["Description"].ToString();

                            oOrderDetail.OrderDetailInsert1(
                               OrderID,
                               ProductID,
                               Quantity,
                               Price,
                               CreateBy,
                               ProductOptionCategoryName,
                               ProductLengthName,
                               Email
                            );
                        }
                        Session["PaymentMethod"] = "money";
                        Session["Message"] = strMessage;
                        Response.Redirect("~/xac-nhan-don-hang.aspx");
                    }
                }
                else if (rbtOnePayNoiDia.Checked)
                {
                    //var dtAddressBook = oAddressBook1.AddressBook1SelectAll("", "", "", Email, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "").DefaultView;
                    //if (dtAddressBook.Count > 0)
                    //    AddressBookID = dtAddressBook[0]["AddressBookID"].ToString();
                    //else
                    //    AddressBookID = "";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                    }
                    var iShippingPrice =
                        Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                    sAmount = Amount + iShippingPrice;

                    var PaymentMethodID = "onepaynd";

                    oOrders.OrdersInsert1(
                        OrderNumber,
                        UserName,
                        OrderStatusID,
                        ShippingStatusID,
                        PaymentMethodID,
                        BillingAddressID,
                        ShippingAddressID,
                        Notes,
                        Comission,
                        "",
                        "",
                        YourAddress,
                        "",
                        Email
                        );

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductID = dr["ProductID"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        string CreateBy = UserName;
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        //string ProductName = dr["ProductName"].ToString();

                        oOrderDetail.OrderDetailInsert1(
                           OrderNumber,
                           ProductID,
                           Quantity,
                           Price,
                           CreateBy,
                           ProductOptionCategoryName,
                           ProductLengthName,
                           Email
                        );
                    }

                    var uri = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, string.Empty) + Request.ApplicationPath;
                    // Core Transaction Fields
                    var vpc_Locale = "vn";
                    var vpc_Version = "2";
                    var vpc_Command = "pay";
                    var vpc_Merchant = "ONEPAY";//Merchant test
                    var vpc_AccessCode = "D67342C2";//AccessCode test
                    //var vpc_Merchant = "PANDEMOS";
                    //var vpc_AccessCode = "JRCFWZTK";
                    var vpc_MerchTxnRef = OrderNumber;
                    var vpc_OrderInfo = OrderNumber;
                    var vpc_Amount = sAmount * 100;
                    var vpc_Currency = "VND";
                    var vpc_ReturnURL = uri + "/thanh-toan-thanh-cong.aspx?ord=" + OrderNumber;
                    //Thong tin khach hang
                    var vpc_SHIP_Street01 = Common.ChangeSymBol(Address);
                    var vpc_SHIP_Provice = Common.ChangeSymBol(DistrictName);
                    var vpc_SHIP_City = Common.ChangeSymBol(ProvinceCode);
                    var vpc_SHIP_Country = "Vietnam";
                    var vpc_Customer_Phone = Common.ChangeSymBol(Phone);
                    var vpc_Customer_Email = Email;
                    var vpc_Customer_Id = "";
                    var vpc_Customer_Name = Common.ChangeSymBol(FirstName);
                    var vpc_TicketNo = "";

                    var vpc_SECURE_SECRET = "A3EFDFABA8653DF2342E8DAC29B51AF0";//Secure Hash test
                    //var vpc_SECURE_SECRET = "04E8DA60020D93506DCC15B7F6A71D26";
                    var vpc_URL_Payment = "https://mtf.onepay.vn/onecomm-pay/vpc.op";//dia chi thanh toan test
                    //var vpc_URL_Payment = "https://onepay.vn/onecomm-pay/vpc.op";//dia chi thanh toan that
                    VPCRequest conn = new VPCRequest(vpc_URL_Payment);
                    conn.SetSecureSecret(vpc_SECURE_SECRET);
                    // Core Transaction Fields
                    conn.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                    conn.AddDigitalOrderField("Title", "onepay paygate");
                    conn.AddDigitalOrderField("vpc_Locale", vpc_Locale);//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                    conn.AddDigitalOrderField("vpc_Version", vpc_Version);
                    conn.AddDigitalOrderField("vpc_Command", vpc_Command);
                    conn.AddDigitalOrderField("vpc_Merchant", vpc_Merchant);
                    conn.AddDigitalOrderField("vpc_AccessCode", vpc_AccessCode);
                    conn.AddDigitalOrderField("vpc_MerchTxnRef", vpc_MerchTxnRef);
                    conn.AddDigitalOrderField("vpc_OrderInfo", vpc_OrderInfo);
                    conn.AddDigitalOrderField("vpc_Amount", vpc_Amount.ToString());
                    conn.AddDigitalOrderField("vpc_Currency", vpc_Currency);
                    conn.AddDigitalOrderField("vpc_ReturnURL", vpc_ReturnURL);
                    //Thong tin khach hang
                    conn.AddDigitalOrderField("vpc_SHIP_Street01", vpc_SHIP_Street01);
                    conn.AddDigitalOrderField("vpc_SHIP_Provice", vpc_SHIP_Provice);
                    conn.AddDigitalOrderField("vpc_SHIP_City", vpc_SHIP_City);
                    conn.AddDigitalOrderField("vpc_SHIP_Country", vpc_SHIP_Country);
                    conn.AddDigitalOrderField("vpc_Customer_Phone", vpc_Customer_Phone);
                    conn.AddDigitalOrderField("vpc_Customer_Email", vpc_Customer_Email);
                    conn.AddDigitalOrderField("vpc_Customer_Id", vpc_Customer_Id);
                    conn.AddDigitalOrderField("vpc_Customer_Name", vpc_Customer_Name);
                    // Dia chi IP cua khach hang
                    conn.AddDigitalOrderField("vpc_TicketNo", vpc_TicketNo);
                    // Chuyen huong trinh duyet sang cong thanh toan
                    Session["PaymentMethod"] = "onepaynd";
                    Session["Message"] = strMessage;
                    Session["AddressBookID"] = AddressBookID;
                    String url = conn.Create3PartyQueryString();
                    Page.Response.Redirect(url);
                }
                else if (rbtOnePayQuocTe.Checked)
                {
                    //var dtAddressBook = oAddressBook1.AddressBook1SelectAll("", "", "", Email, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "").DefaultView;
                    //if (dtAddressBook.Count > 0)
                    //    AddressBookID = dtAddressBook[0]["AddressBookID"].ToString();
                    //else
                    //    AddressBookID = "";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                    }
                    var iShippingPrice =
                        Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                    sAmount = Amount + iShippingPrice;

                    var PaymentMethodID = "onepayqt";

                    oOrders.OrdersInsert1(
                        OrderNumber,
                        UserName,
                        OrderStatusID,
                        ShippingStatusID,
                        PaymentMethodID,
                        BillingAddressID,
                        ShippingAddressID,
                        Notes,
                        Comission,
                        "",
                        "",
                        YourAddress,
                        "",
                        Email
                        );

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductID = dr["ProductID"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        string CreateBy = UserName;
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        //string ProductName = dr["ProductName"].ToString();

                        oOrderDetail.OrderDetailInsert1(
                           OrderNumber,
                           ProductID,
                           Quantity,
                           Price,
                           CreateBy,
                           ProductOptionCategoryName,
                           ProductLengthName,
                           Email
                        );
                    }

                    var uri = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, string.Empty) + Request.ApplicationPath;
                    // Core Transaction Fields
                    var vpc_Locale = "en";
                    var vpc_Version = "2";
                    var vpc_Command = "pay";
                    var vpc_Merchant = "TESTONEPAY";//Merchant Test
                    var vpc_AccessCode = "6BEB2546";//Access Code Test
                    //var vpc_Merchant = "PANDEMOS";
                    //var vpc_AccessCode = "B94D84AE";
                    var vpc_MerchTxnRef = OrderNumber;
                    var vpc_OrderInfo = OrderNumber;
                    var vpc_Amount = sAmount * 100;
                    var vpc_Currency = "VND";
                    var vpc_ReturnURL = uri + "/thanh-toan-thanh-cong.aspx?ord=" + OrderNumber;
                    //Thong tin khach hang
                    var vpc_SHIP_Street01 = "194 Tran Quang Khai";
                    var vpc_SHIP_Provice = "Hanoi";
                    var vpc_SHIP_City = "Hanoi";
                    var vpc_SHIP_Country = "Vietnam";
                    var vpc_Customer_Phone = "043966668";
                    var vpc_Customer_Email = "support@onepay.vn";
                    var vpc_Customer_Id = "onepay_paygate";
                    var vpc_Customer_Name = "";
                    var vpc_TicketNo = "";

                    var vpc_SECURE_SECRET = "6D0870CDE5F24F34F3915FB0045120DB";//Secure Hash test
                    //var vpc_SECURE_SECRET = "C7BB42E2BE08E07FDF7210CB381FA04A";
                    var vpc_URL_Payment = "https://mtf.onepay.vn/vpcpay/vpcpay.op";//dia chi thanh toan test
                    //var vpc_URL_Payment = "https://onepay.vn/vpcpay/vpcpay.op";//dia chi thanh toan that
                    VPCRequest conn = new VPCRequest(vpc_URL_Payment);
                    conn.SetSecureSecret(vpc_SECURE_SECRET);
                    // Core Transaction Fields
                    conn.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                    conn.AddDigitalOrderField("Title", "onepay paygate");
                    conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                    conn.AddDigitalOrderField("vpc_Version", vpc_Version);
                    conn.AddDigitalOrderField("vpc_Command", vpc_Command);
                    conn.AddDigitalOrderField("vpc_Merchant", vpc_Merchant);
                    conn.AddDigitalOrderField("vpc_AccessCode", vpc_AccessCode);
                    conn.AddDigitalOrderField("vpc_MerchTxnRef", vpc_MerchTxnRef);
                    conn.AddDigitalOrderField("vpc_OrderInfo", vpc_OrderInfo);
                    conn.AddDigitalOrderField("vpc_Amount", vpc_Amount.ToString());
                    conn.AddDigitalOrderField("vpc_ReturnURL", vpc_ReturnURL);
                    // Thong tin them ve khach hang. De trong neu khong co thong tin
                    conn.AddDigitalOrderField("vpc_SHIP_Street01", vpc_SHIP_Street01);
                    conn.AddDigitalOrderField("vpc_SHIP_Provice", vpc_SHIP_Provice);
                    conn.AddDigitalOrderField("vpc_SHIP_City", vpc_SHIP_City);
                    conn.AddDigitalOrderField("vpc_SHIP_Country", vpc_SHIP_Country);
                    conn.AddDigitalOrderField("vpc_Customer_Phone", vpc_Customer_Phone);
                    conn.AddDigitalOrderField("vpc_Customer_Email", vpc_Customer_Email);
                    conn.AddDigitalOrderField("vpc_Customer_Id", vpc_Customer_Id);
                    conn.AddDigitalOrderField("vpc_Customer_Name", vpc_Customer_Name);
                    // Dia chi IP cua khach hang
                    conn.AddDigitalOrderField("vpc_TicketNo", vpc_TicketNo);
                    // Chuyen huong trinh duyet sang cong thanh toan
                    Session["PaymentMethod"] = "onepayqt";
                    Session["Message"] = strMessage;
                    Session["AddressBookID"] = AddressBookID;
                    String url = conn.Create3PartyQueryString();
                    Page.Response.Redirect(url);
                }
                else if (rbtEmail.Checked)
                {
                    string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                    Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";

                    Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                    Body += "<p>Mã số đơn hàng của bạn là <b>" + OrderNumber + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. Để theo dõi đơn hàng, xin vui lòng vào mục <a style='font-size: 11px;' href='http://www.pandemos.vn/kiem-tra-don-hang.aspx'>theo dõi đơn hàng</a></p>";
                    //Body += "<p>Your order ID is <b>" + OrderNumber + "</b>. A summary of your order is shown below. To view the status of your order <a style='font-size: 11px;' href='http://www.pandemos.vn/theo-doi-don-hang.aspx'>click here.</a></p>";
                    Body += "</div>";
                    //Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p><p>Your order requires payment before it can be finalized. Please check our website for available methods</p></div>";
                    Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p></div>";
                    //Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người mua/Buyer</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + BuyerName + "</b></p><p>" + Address1 + "</p><p>" + DistrictName1 + "</p><p>" + ProvinceCode1 + "</p></div></td><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                    Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                    Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><h4 style='font-size: 18px;'>Chi tiết đơn hàng/Your Order Contains...</h4>";

                    Body += "<div style='font-size: 11px; font-family: Verdana'>";
                    //Body += "<p><b>* Hình thức giao hàng</b>: " + DeliveryMethodsEmail + "</p>";
                    //Body += "<p><b>* Hình thức thanh toán</b>:" + ServiceName + "</p>";
                    Body += "<p><b>* Phương thức thanh toán</b>: Thanh toán bằng chuyển khoản trực tiếp</p>";
                    //Body += "<p><b>* Ngày - Giờ giao</b>: " + EmailDeliveryDate + "</p>";
                    Body += "</div>";

                    Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                    //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                    Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductCode = dr["Tag"].ToString();
                        //string ProductID = dr["ProductID"].ToString();
                        string ProductName = dr["ProductName"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                        var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                        Body += "<tr>";
                        Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + " - " + ProductLengthName + "</td>";
                        //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                        Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                        Body += "</tr>";
                    }
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    var iShippingPrice =
                        Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                    sAmount = Amount + iShippingPrice;
                    //sAmount = Amount;

                    var tAmount = string.Format("{0:##,###.##}", Amount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                    var Shipping = string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                    var SubTotal = string.Format("{0:##,###.##}", sAmount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";

                    Body += "<table style='font-size: 11px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                    Body += "<tr><td style='width:85%;'>Thành tiền/Subtotal:</td><td style='width:15%;'>" + tAmount + "</td></tr>";
                    Body += "<tr><td>Phí giao hàng/Shipping:</td><td>" + Shipping + "</td></tr>";
                    Body += "<tr><td><b>Tổng tiền/Grand Total:</b></td><td><b>" + SubTotal + "</b></td></tr>";
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    //Body += "<ul style='font-size: 11px; font-style: italic; padding: 0;margin: 0; list-style-type: none;'>";
                    //Body += "<li><b>*</b> Giá sản phẩm chưa bao gồm thuế VAT 10%/ Item price is excluded of 10% VAT</li>";
                    //Body += "<li><b>*</b> Xin vui lòng <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>gọi điện</a> tới Đồng Hồ Anh Minhs-Hoa Trái Cây để thay đổi nếu Quý khách muốn sửa đơn hàng/ Please <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>call</a> Đồng Hồ Anh Minhs-Hoa Trái Cây if you are in need of making a modification to your Order </li>";
                    //Body += "<li><b>*</b> Vui lòng tham khảo các điều khoản về Thay đổi và Hủy đơn hàng trong <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Thỏa Thuận Sử Dụng</a>/Please check Policy for Order Change and Cancelation in our <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Term of Use</a></li>";
                    //Body += "</ul>";
                    Body += "</div>";
                    Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                    Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                    Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>Pandemos</h4>";
                    Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                    Body += "<p>Add: 403, Hai Bà Trưng , P.8, Quận 3, HCM </p>";
                    Body += "<p>Tel: (08)3 820 8577 - Hotline: 0902 563 577 </p>";
                    //Body += "<p>M: +84 908 xxx xxx>";

                    Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                    Body += "<p>E: <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a></p>";
                    Body += "</div>";
                    Body += "</div>";
                    Body += "</div>";

                    //var bSendEmail = Common.SendMail(Host, Port, From, strDisplayNameMailFrom, sPassword, Email, To, Subject, Body, false);
                    var bSendEmail = Common.SendMail(Host, Port, From, sPassword, Email, To, Subject, Body, true);
                    if (bSendEmail)
                    {
                        //var oOrders = new Orders();
                        //var oOrderDetail = new OrderDetail();
                        //var dtAddressBook = oAddressBook1.AddressBook1SelectAll("", "", "", Email, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "").DefaultView;
                        //if (dtAddressBook.Count > 0)
                        //    AddressBookID = dtAddressBook[0]["AddressBookID"].ToString();
                        //else
                        //    AddressBookID = "";
                        //string OrderID = Session["OrderNumber"].ToString();
                        //var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
                        //var OrderStatusID = "1";
                        //var ShippingStatusID = "1";
                        var PaymentMethodID = "transfer";
                        //var BillingAddressID = AddressBookID;
                        //var ShippingAddressID = AddressBookID;
                        //var Notes = txtMessage1.Text;
                        //var Comission = "";

                        oOrders.OrdersInsert1(
                            OrderID,
                            UserName,
                            OrderStatusID,
                            ShippingStatusID,
                            PaymentMethodID,
                            BillingAddressID,
                            ShippingAddressID,
                            Notes,
                            Comission,
                            "",
                            "",
                            YourAddress,
                            "",
                            Email
                            );
                        foreach (DataRow dr in dtCart.Rows)
                        {
                            string ProductID = dr["ProductID"].ToString();
                            string Quantity = dr["Quantity"].ToString();
                            string Price = dr["Price"].ToString();
                            string CreateBy = UserName;
                            string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                            string ProductLengthName = dr["ProductLengthName"].ToString();
                            //string ProductName = dr["ProductName"].ToString();
                            //string Type = dr["Tag"].ToString();
                            //string Description = dr["Description"].ToString();

                            oOrderDetail.OrderDetailInsert1(
                               OrderID,
                               ProductID,
                               Quantity,
                               Price,
                               CreateBy,
                               ProductOptionCategoryName,
                               ProductLengthName,
                               Email
                            );
                        }
                        Session["PaymentMethod"] = "transfer";
                        Session["Message"] = strMessage;
                        Response.Redirect("~/xac-nhan-don-hang.aspx");
                    }
                }
            }
        }
    }
    protected void btnOrderLogin_Click(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            string OrderNumber = DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);
            Session["OrderNumber"] = OrderNumber;
            double Amount = 0, sAmount = 0;
            string LastName,
                   FirstName,
                   Address,
                   Email,
                   ProvinceCode,
                   DistrictName,
                   CountryName,
                   AddressBookID,
                   HomePhone,
                   strMessage;
            //CellPhone,
            //CountryCode,
            //City,
            //Nationality,
            //ZipCode;

            var dtAddressBook = (DataView)OdsAddressBook.Select();
            AddressBookID = dtAddressBook[0]["AddressBookID"].ToString();
            LastName = dtAddressBook[0]["LastName"].ToString();
            FirstName = dtAddressBook[0]["FirstName"].ToString();
            Address = dtAddressBook[0]["Address1"].ToString();
            Email = dtAddressBook[0]["Email"].ToString();
            ProvinceCode = dtAddressBook[0]["ProvinceName"].ToString();
            CountryName = dtAddressBook[0]["CountryName"].ToString();
            DistrictName = dtAddressBook[0]["DistrictName"].ToString();
            HomePhone = (FormView1.FindControl("txtPhone") as TextBox).Text;
            strMessage = (FormView1.FindControl("txtMessage") as TextBox).Text;

            //ZipCode = dtAddressBook[0]["ZipCode"].ToString();
            //City = dtAddressBook[0]["City"].ToString();
            //CountryCode = dtAddressBook[0]["CountryShortName"].ToString();
            //Nationality = dtAddressBook[0]["Nationality"].ToString();
            //HomePhone = dtAddressBook[0]["HomePhone"].ToString();
            //CellPhone = dtAddressBook[0]["CellPhone"].ToString();
            //var BuyerName = LastName1 + " " + FirstName1;
            //var BuyerAddress = Address1 + ", " + DistrictName1 + ", " + ProvinceCode1 + ", " + CountryName1;
            //var lblSubTotal = ((Label)lstShoppingCart.FindControl("lblSubTotal")).Text.Trim();
            var ShippingPrice = Session["ShippingPrice"];
            //var To = "sales@pandemos.vn";
            //var Subject = "Đặt hàng/Order";
            var YourName = FirstName + " " + LastName;
            //var YourEmail = Email;
            var YourAddress = Address + ", " + DistrictName + ", " + ProvinceCode + ", " + CountryName;

            //var To = "sales@pandemos.vn";
            var To = "hungtien408@gmail.com";
            var Subject = "Chúng tôi đã nhận được đơn hàng: " + OrderNumber;
            //var Host = "118.69.199.203";
            //int Port = 25;
            var Host = "smtp.gmail.com";
            int Port = 587;
            var strDisplayNameMailFrom = "";
            var From = "webmastersendmail0401@gmail.com";
            var sPassword = "web123master";
            //var strDisplayNameMailFrom = "Pandemos - Đặt Hàng";
            //var From = "customerservice@pandemos.vn";
            //var sPassword = "pandemos@2014";
            bool bEnableSSL = true;
            //string Host = "118.69.199.203";
            //int Port = 25;
            //string From = "customerservice@pandemos.vn";
            //string Password = "pandemos@2014";

            var oOrders = new Orders();
            var oOrderDetail = new OrderDetail();

            var OrderID = OrderNumber;
            var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
            var OrderStatusID = "1";
            var ShippingStatusID = "1";
            var BillingAddressID = AddressBookID;
            var ShippingAddressID = AddressBookID;
            var Notes = strMessage;
            var Comission = "";

            if (rbtMoney.Checked)
            {
                //var To = "sales@pandemos.vn";

                string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";

                Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                Body += "<p>Mã số đơn hàng của bạn là <b>" + OrderNumber + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. Để theo dõi đơn hàng, xin vui lòng vào mục <a style='font-size: 11px;' href='http://www.pandemos.vn/kiem-tra-don-hang.aspx'>theo dõi đơn hàng</a></p>";
                //Body += "<p>Your order ID is <b>" + OrderNumber + "</b>. A summary of your order is shown below. To view the status of your order <a style='font-size: 11px;' href='http://www.pandemos.vn/theo-doi-don-hang.aspx'>click here.</a></p>";
                Body += "</div>";
                //Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p><p>Your order requires payment before it can be finalized. Please check our website for available methods</p></div>";
                Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p></div>";
                //Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người mua/Buyer</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + BuyerName + "</b></p><p>" + Address1 + "</p><p>" + DistrictName1 + "</p><p>" + ProvinceCode1 + "</p></div></td><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><h4 style='font-size: 18px;'>Chi tiết đơn hàng/Your Order Contains...</h4>";

                Body += "<div style='font-size: 11px; font-family: Verdana'>";
                //Body += "<p><b>* Hình thức giao hàng</b>: " + DeliveryMethodsEmail + "</p>";
                //Body += "<p><b>* Hình thức thanh toán</b>:" + ServiceName + "</p>";
                Body += "<p><b>* Phương thức thanh toán</b>: Tiền mặt</p>";
                //Body += "<p><b>* Ngày - Giờ giao</b>: " + EmailDeliveryDate + "</p>";
                Body += "</div>";

                Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductCode = dr["Tag"].ToString();
                    //string ProductID = dr["ProductID"].ToString();
                    string ProductName = dr["ProductName"].ToString();
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    string ProductLengthName = dr["ProductLengthName"].ToString();
                    double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                    var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                    var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                    Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                    Body += "<tr>";
                    Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + " - " + ProductLengthName + "</td>";
                    //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
                    Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                    Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                    Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                    Body += "</tr>";
                }
                Body += "</table>";
                Body += "<div style='clear: both;'></div>";
                var iShippingPrice =
                    Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                sAmount = Amount + iShippingPrice;
                //sAmount = Amount;

                var tAmount = string.Format("{0:##,###.##}", Amount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                var Shipping = string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                var SubTotal = string.Format("{0:##,###.##}", sAmount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";

                Body += "<table style='font-size: 11px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                Body += "<tr><td style='width:85%;'>Thành tiền/Subtotal:</td><td style='width:15%;'>" + tAmount + "</td></tr>";
                Body += "<tr><td>Phí giao hàng/Shipping:</td><td>" + Shipping + "</td></tr>";
                Body += "<tr><td><b>Tổng tiền/Grand Total:</b></td><td><b>" + SubTotal + "</b></td></tr>";
                Body += "</table>";
                Body += "<div style='clear: both;'></div>";
                //Body += "<ul style='font-size: 11px; font-style: italic; padding: 0;margin: 0; list-style-type: none;'>";
                //Body += "<li><b>*</b> Giá sản phẩm chưa bao gồm thuế VAT 10%/ Item price is excluded of 10% VAT</li>";
                //Body += "<li><b>*</b> Xin vui lòng <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>gọi điện</a> tới Đồng Hồ Anh Minhs-Hoa Trái Cây để thay đổi nếu Quý khách muốn sửa đơn hàng/ Please <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>call</a> Đồng Hồ Anh Minhs-Hoa Trái Cây if you are in need of making a modification to your Order </li>";
                //Body += "<li><b>*</b> Vui lòng tham khảo các điều khoản về Thay đổi và Hủy đơn hàng trong <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Thỏa Thuận Sử Dụng</a>/Please check Policy for Order Change and Cancelation in our <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Term of Use</a></li>";
                //Body += "</ul>";
                Body += "</div>";
                Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>Pandemos</h4>";
                Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                Body += "<p>Add: 403, Hai Bà Trưng , P.8, Quận 3, HCM </p>";
                Body += "<p>Tel: (08)3 820 8577 - Hotline: 0902 563 577 </p>";
                //Body += "<p>M: +84 908 xxx xxx>";

                Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                Body += "<p>E: <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a></p>";
                Body += "</div>";
                Body += "</div>";
                Body += "</div>";

                var bSendEmail = Common.SendMail(Host, Port, From, sPassword, Email, To, Subject, Body, true);
                //var a = Common.SendMail(Host, Port, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "LIÊN HỆ CÔNG TY TNHH THƯƠNG MẠI - XUẤT KHẨU SONG KIM LONG HẢI", Body, true);
                if (bSendEmail)
                {
                    //var OrderID = OrderNumber;
                    //var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
                    //var OrderStatusID = "1";
                    //var ShippingStatusID = "1";
                    var PaymentMethodID = "money";
                    //var BillingAddressID = AddressBookID;
                    //var ShippingAddressID = AddressBookID;
                    //var Notes = strMessage;
                    //var Comission = "";

                    oOrders.OrdersInsert1(
                        OrderID,
                        UserName,
                        OrderStatusID,
                        ShippingStatusID,
                        PaymentMethodID,
                        BillingAddressID,
                        ShippingAddressID,
                        Notes,
                        Comission,
                        "",
                        "",
                        YourAddress,
                        "",
                        Email
                        );
                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductID = dr["ProductID"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        string CreateBy = UserName;
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        //string ProductName = dr["ProductName"].ToString();
                        //string Type = dr["Tag"].ToString();
                        //string Description = dr["Description"].ToString();

                        oOrderDetail.OrderDetailInsert1(
                           OrderID,
                           ProductID,
                           Quantity,
                           Price,
                           CreateBy,
                           ProductOptionCategoryName,
                           ProductLengthName,
                           Email
                        );
                    }
                    Session["PaymentMethod"] = "money";
                    Session["Message"] = strMessage;
                    Response.Redirect("~/xac-nhan-don-hang.aspx");
                }
            }
            else if (rbtOnePayNoiDia.Checked)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                }
                var iShippingPrice =
                    Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                sAmount = Amount + iShippingPrice;

                //var OrderID = OrderNumber;
                //var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
                //var OrderStatusID = "1";
                //var ShippingStatusID = "1";
                var PaymentMethodID = "onepaynd";
                //var BillingAddressID = AddressBookID;
                //var ShippingAddressID = AddressBookID;
                //var Notes = strMessage;
                //var Comission = "";

                oOrders.OrdersInsert1(
                    OrderID,
                    UserName,
                    OrderStatusID,
                    ShippingStatusID,
                    PaymentMethodID,
                    BillingAddressID,
                    ShippingAddressID,
                    Notes,
                    Comission,
                    "",
                    "",
                    YourAddress,
                    "",
                    Email
                    );
                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductID = dr["ProductID"].ToString();
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    string CreateBy = UserName;
                    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    string ProductLengthName = dr["ProductLengthName"].ToString();

                    oOrderDetail.OrderDetailInsert1(
                       OrderID,
                       ProductID,
                       Quantity,
                       Price,
                       CreateBy,
                       ProductOptionCategoryName,
                       ProductLengthName,
                       Email
                    );
                }
                oOrders.OrdersQuickUpdate_PayStatusID(
                        OrderNumber,
                        "2"
                        );
                var uri = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, string.Empty) + Request.ApplicationPath;
                // Core Transaction Fields
                var vpc_Locale = "vn";
                var vpc_Version = "2";
                var vpc_Command = "pay";
                var vpc_Merchant = "ONEPAY";//Merchant test
                var vpc_AccessCode = "D67342C2";//Access Code test
                //var vpc_Merchant = "PANDEMOS";
                //var vpc_AccessCode = "JRCFWZTK";
                var vpc_MerchTxnRef = OrderNumber;
                var vpc_OrderInfo = OrderNumber;
                var vpc_Amount = sAmount * 100;
                var vpc_Currency = "VND";
                var vpc_ReturnURL = uri + "/thanh-toan-thanh-cong.aspx?ord=" + OrderNumber;
                //Thong tin khach hang
                var vpc_SHIP_Street01 = Common.ChangeSymBol(Address);
                var vpc_SHIP_Provice = Common.ChangeSymBol(DistrictName);
                var vpc_SHIP_City = Common.ChangeSymBol(ProvinceCode);
                var vpc_SHIP_Country = "Vietnam";
                var vpc_Customer_Phone = Common.ChangeSymBol(HomePhone);
                var vpc_Customer_Email = Email;
                var vpc_Customer_Id = "";
                var vpc_Customer_Name = Common.ChangeSymBol(FirstName);
                var vpc_TicketNo = "";

                var vpc_SECURE_SECRET = "A3EFDFABA8653DF2342E8DAC29B51AF0";//Secure Hash test
                //var vpc_SECURE_SECRET = "04E8DA60020D93506DCC15B7F6A71D26";
                var vpc_URL_Payment = "https://mtf.onepay.vn/onecomm-pay/vpc.op";//dia chi thanh toan test
                //var vpc_URL_Payment = "https://onepay.vn/onecomm-pay/vpc.op";//dia chi thanh toan that
                VPCRequest conn = new VPCRequest(vpc_URL_Payment);
                conn.SetSecureSecret(vpc_SECURE_SECRET);
                // Core Transaction Fields
                conn.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                conn.AddDigitalOrderField("Title", "onepay paygate");
                conn.AddDigitalOrderField("vpc_Locale", vpc_Locale);//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                conn.AddDigitalOrderField("vpc_Version", vpc_Version);
                conn.AddDigitalOrderField("vpc_Command", vpc_Command);
                conn.AddDigitalOrderField("vpc_Merchant", vpc_Merchant);
                conn.AddDigitalOrderField("vpc_AccessCode", vpc_AccessCode);
                conn.AddDigitalOrderField("vpc_MerchTxnRef", vpc_MerchTxnRef);
                conn.AddDigitalOrderField("vpc_OrderInfo", vpc_OrderInfo);
                conn.AddDigitalOrderField("vpc_Amount", vpc_Amount.ToString());
                conn.AddDigitalOrderField("vpc_Currency", vpc_Currency);
                conn.AddDigitalOrderField("vpc_ReturnURL", vpc_ReturnURL);
                //Thong tin khach hang
                conn.AddDigitalOrderField("vpc_SHIP_Street01", vpc_SHIP_Street01);
                conn.AddDigitalOrderField("vpc_SHIP_Provice", vpc_SHIP_Provice);
                conn.AddDigitalOrderField("vpc_SHIP_City", vpc_SHIP_City);
                conn.AddDigitalOrderField("vpc_SHIP_Country", vpc_SHIP_Country);
                conn.AddDigitalOrderField("vpc_Customer_Phone", vpc_Customer_Phone);
                conn.AddDigitalOrderField("vpc_Customer_Email", vpc_Customer_Email);
                conn.AddDigitalOrderField("vpc_Customer_Id", vpc_Customer_Id);
                conn.AddDigitalOrderField("vpc_Customer_Name", vpc_Customer_Name);
                // Dia chi IP cua khach hang
                conn.AddDigitalOrderField("vpc_TicketNo", vpc_TicketNo);
                // Chuyen huong trinh duyet sang cong thanh toan
                Session["PaymentMethod"] = "onepaynd";
                Session["Message"] = strMessage;
                String url = conn.Create3PartyQueryString();
                Page.Response.Redirect(url);
            }
            else if (rbtOnePayQuocTe.Checked)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                }
                var iShippingPrice =
                    Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                sAmount = Amount + iShippingPrice;

                //var OrderID = OrderNumber;
                //var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
                //var OrderStatusID = "1";
                //var ShippingStatusID = "1";
                var PaymentMethodID = "onepayqt";
                //var BillingAddressID = AddressBookID;
                //var ShippingAddressID = AddressBookID;
                //var Notes = strMessage;
                //var Comission = "";

                oOrders.OrdersInsert1(
                    OrderID,
                    UserName,
                    OrderStatusID,
                    ShippingStatusID,
                    PaymentMethodID,
                    BillingAddressID,
                    ShippingAddressID,
                    Notes,
                    Comission,
                    "",
                    "",
                    YourAddress,
                    "",
                    Email
                    );
                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductID = dr["ProductID"].ToString();
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    string CreateBy = UserName;
                    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    string ProductLengthName = dr["ProductLengthName"].ToString();

                    oOrderDetail.OrderDetailInsert1(
                       OrderID,
                       ProductID,
                       Quantity,
                       Price,
                       CreateBy,
                       ProductOptionCategoryName,
                       ProductLengthName,
                       Email
                    );
                }
                oOrders.OrdersQuickUpdate_PayStatusID(
                        OrderNumber,
                        "2"
                        );

                var uri = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, string.Empty) + Request.ApplicationPath;
                // Core Transaction Fields
                var vpc_Locale = "en";
                var vpc_Version = "2";
                var vpc_Command = "pay";
                var vpc_Merchant = "TESTONEPAY";//Merchant Test
                var vpc_AccessCode = "6BEB2546";//Access Code Test
                //var vpc_Merchant = "PANDEMOS";
                //var vpc_AccessCode = "B94D84AE";
                var vpc_MerchTxnRef = OrderNumber;
                var vpc_OrderInfo = OrderNumber;
                var vpc_Amount = sAmount * 100;
                var vpc_Currency = "VND";
                var vpc_ReturnURL = uri + "/thanh-toan-thanh-cong.aspx?ord=" + OrderNumber;
                //Thong tin khach hang
                var vpc_SHIP_Street01 = "194 Tran Quang Khai";
                var vpc_SHIP_Provice = "Hanoi";
                var vpc_SHIP_City = "Hanoi";
                var vpc_SHIP_Country = "Vietnam";
                var vpc_Customer_Phone = "043966668";
                var vpc_Customer_Email = "support@onepay.vn";
                var vpc_Customer_Id = "onepay_paygate";
                var vpc_Customer_Name = "";
                var vpc_TicketNo = "";

                var vpc_SECURE_SECRET = "6D0870CDE5F24F34F3915FB0045120DB";//Secure Hash test
                //var vpc_SECURE_SECRET = "C7BB42E2BE08E07FDF7210CB381FA04A";
                var vpc_URL_Payment = "https://mtf.onepay.vn/vpcpay/vpcpay.op";//dia chi thanh toan test
                //var vpc_URL_Payment = "https://onepay.vn/vpcpay/vpcpay.op";//dia chi thanh toan that
                VPCRequest conn = new VPCRequest(vpc_URL_Payment);
                conn.SetSecureSecret(vpc_SECURE_SECRET);
                // Core Transaction Fields
                conn.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                conn.AddDigitalOrderField("Title", "onepay paygate");
                conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                conn.AddDigitalOrderField("vpc_Version", vpc_Version);
                conn.AddDigitalOrderField("vpc_Command", vpc_Command);
                conn.AddDigitalOrderField("vpc_Merchant", vpc_Merchant);
                conn.AddDigitalOrderField("vpc_AccessCode", vpc_AccessCode);
                conn.AddDigitalOrderField("vpc_MerchTxnRef", vpc_MerchTxnRef);
                conn.AddDigitalOrderField("vpc_OrderInfo", vpc_OrderInfo);
                conn.AddDigitalOrderField("vpc_Amount", vpc_Amount.ToString());
                conn.AddDigitalOrderField("vpc_ReturnURL", vpc_ReturnURL);
                // Thong tin them ve khach hang. De trong neu khong co thong tin
                conn.AddDigitalOrderField("vpc_SHIP_Street01", vpc_SHIP_Street01);
                conn.AddDigitalOrderField("vpc_SHIP_Provice", vpc_SHIP_Provice);
                conn.AddDigitalOrderField("vpc_SHIP_City", vpc_SHIP_City);
                conn.AddDigitalOrderField("vpc_SHIP_Country", vpc_SHIP_Country);
                conn.AddDigitalOrderField("vpc_Customer_Phone", vpc_Customer_Phone);
                conn.AddDigitalOrderField("vpc_Customer_Email", vpc_Customer_Email);
                conn.AddDigitalOrderField("vpc_Customer_Id", vpc_Customer_Id);
                conn.AddDigitalOrderField("vpc_Customer_Name", vpc_Customer_Name);
                // Dia chi IP cua khach hang
                conn.AddDigitalOrderField("vpc_TicketNo", vpc_TicketNo);
                // Chuyen huong trinh duyet sang cong thanh toan
                Session["PaymentMethod"] = "onepayqt";
                Session["Message"] = strMessage;
                //Common.ShowAlert(vpc_SHIP_Provice);
                String url = conn.Create3PartyQueryString();
                Page.Response.Redirect(url);
            }
            else if (rbtEmail.Checked)
            {
                string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";

                Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                Body += "<p>Mã số đơn hàng của bạn là <b>" + OrderNumber + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. Để theo dõi đơn hàng, xin vui lòng vào mục <a style='font-size: 11px;' href='http://www.pandemos.vn/kiem-tra-don-hang.aspx'>theo dõi đơn hàng</a></p>";
                //Body += "<p>Your order ID is <b>" + OrderNumber + "</b>. A summary of your order is shown below. To view the status of your order <a style='font-size: 11px;' href='http://www.pandemos.vn/theo-doi-don-hang.aspx'>click here.</a></p>";
                Body += "</div>";
                //Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p><p>Your order requires payment before it can be finalized. Please check our website for available methods</p></div>";
                Body += "<div style='padding: 10px; background-color: rgb(255, 239, 239); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'><p>Để hoàn tất đặt hàng xin vui lòng thanh toán đơn hàng theo một trong các phương thức hiện có trên website</p></div>";
                //Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người mua/Buyer</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + BuyerName + "</b></p><p>" + Address1 + "</p><p>" + DistrictName1 + "</p><p>" + ProvinceCode1 + "</p></div></td><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><table style='width: 100%' cellpadding='0' cellspacing='0'><tr><td style='width: 50%;'><h4 style='font-size: 18px; margin-bottom: 5px; margin-bottom: 20px;'>Người nhận/Recipient</h4><div style='font-size: 11px;font-family: Verdana;'><p><b>" + YourName + "</b></p><p>" + Address + "</p><p>" + DistrictName + "</p><p>" + ProvinceCode + "</p></div></td></tr></table></div>";
                Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'><h4 style='font-size: 18px;'>Chi tiết đơn hàng/Your Order Contains...</h4>";

                Body += "<div style='font-size: 11px; font-family: Verdana'>";
                //Body += "<p><b>* Hình thức giao hàng</b>: " + DeliveryMethodsEmail + "</p>";
                //Body += "<p><b>* Hình thức thanh toán</b>:" + ServiceName + "</p>";
                Body += "<p><b>* Phương thức thanh toán</b>: Thanh toán bằng chuyển khoản trực tiếp</p>";
                //Body += "<p><b>* Ngày - Giờ giao</b>: " + EmailDeliveryDate + "</p>";
                Body += "</div>";

                Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductCode = dr["Tag"].ToString();
                    string ProductID = dr["ProductID"].ToString();
                    string ProductName = dr["ProductName"].ToString();
                    string Quantity = dr["Quantity"].ToString();
                    string Price = dr["Price"].ToString();
                    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    string ProductLengthName = dr["ProductLengthName"].ToString();
                    double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                    var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                    var sPrice = string.Format("{0:##,###.##}", dr["Price"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                    Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                    Body += "<tr>";
                    Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + " - " + ProductLengthName + "</td>";
                    //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductColorName + "</td>";
                    Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                    Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                    Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                    Body += "</tr>";
                }
                Body += "</table>";
                Body += "<div style='clear: both;'></div>";
                var iShippingPrice =
                    Convert.ToDouble(string.IsNullOrEmpty(ShippingPrice.ToString()) ? "0" : ShippingPrice);
                sAmount = Amount + iShippingPrice;
                //sAmount = Amount;

                var tAmount = string.Format("{0:##,###.##}", Amount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                var Shipping = string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                var SubTotal = string.Format("{0:##,###.##}", sAmount).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";

                Body += "<table style='font-size: 11px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                Body += "<tr><td style='width:85%;'>Thành tiền/Subtotal:</td><td style='width:15%;'>" + tAmount + "</td></tr>";
                Body += "<tr><td>Phí giao hàng/Shipping:</td><td>" + Shipping + "</td></tr>";
                Body += "<tr><td><b>Tổng tiền/Grand Total:</b></td><td><b>" + SubTotal + "</b></td></tr>";
                Body += "</table>";
                Body += "<div style='clear: both;'></div>";
                //Body += "<ul style='font-size: 11px; font-style: italic; padding: 0;margin: 0; list-style-type: none;'>";
                //Body += "<li><b>*</b> Giá sản phẩm chưa bao gồm thuế VAT 10%/ Item price is excluded of 10% VAT</li>";
                //Body += "<li><b>*</b> Xin vui lòng <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>gọi điện</a> tới Đồng Hồ Anh Minhs-Hoa Trái Cây để thay đổi nếu Quý khách muốn sửa đơn hàng/ Please <a style='font-size: 11px;' href='http://www.pandemos.vn/lien-he.aspx'>call</a> Đồng Hồ Anh Minhs-Hoa Trái Cây if you are in need of making a modification to your Order </li>";
                //Body += "<li><b>*</b> Vui lòng tham khảo các điều khoản về Thay đổi và Hủy đơn hàng trong <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Thỏa Thuận Sử Dụng</a>/Please check Policy for Order Change and Cancelation in our <a style='font-size: 11px;' href='http://www.pandemos.vn/thoa-thuan-su-dung.aspx'>Term of Use</a></li>";
                //Body += "</ul>";
                Body += "</div>";
                Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>Pandemos</h4>";
                Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                Body += "<p>Add: 403, Hai Bà Trưng , P.8, Quận 3, HCM </p>";
                Body += "<p>Tel: (08)3 820 8577 - Hotline: 0902 563 577 </p>";
                //Body += "<p>M: +84 908 xxx xxx>";

                Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                Body += "<p>E: <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a></p>";
                Body += "</div>";
                Body += "</div>";
                Body += "</div>";

                //var bSendEmail = Common.SendMail(Host, Port, From, strDisplayNameMailFrom, sPassword, Email, To, Subject, Body, false);
                var bSendEmail = Common.SendMail(Host, Port, From, sPassword, Email, To, Subject, Body, true);
                if (bSendEmail)
                {
                    //var OrderID = OrderNumber;
                    //var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
                    //var OrderStatusID = "1";
                    //var ShippingStatusID = "1";
                    var PaymentMethodID = "transfer";
                    //var BillingAddressID = AddressBookID;
                    //var ShippingAddressID = AddressBookID;
                    //var Notes = strMessage;
                    //var Comission = "";

                    oOrders.OrdersInsert1(
                        OrderID,
                        UserName,
                        OrderStatusID,
                        ShippingStatusID,
                        PaymentMethodID,
                        BillingAddressID,
                        ShippingAddressID,
                        Notes,
                        Comission,
                        "",
                        "",
                        YourAddress,
                        "",
                        Email
                        );
                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductID = dr["ProductID"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        string Price = dr["Price"].ToString();
                        string CreateBy = UserName;
                        string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        string ProductLengthName = dr["ProductLengthName"].ToString();
                        //string ProductName = dr["ProductName"].ToString();
                        //string Type = dr["Tag"].ToString();
                        //string Description = dr["Description"].ToString();

                        oOrderDetail.OrderDetailInsert1(
                           OrderID,
                           ProductID,
                           Quantity,
                           Price,
                           CreateBy,
                           ProductOptionCategoryName,
                           ProductLengthName,
                           Email
                        );
                    }
                    Session["PaymentMethod"] = "transfer";
                    Session["Message"] = strMessage;
                    Response.Redirect("~/xac-nhan-don-hang.aspx");
                }
            }
        }

    }
}