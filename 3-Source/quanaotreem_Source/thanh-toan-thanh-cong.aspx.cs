using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;
using WebApplication2;

public partial class xac_nhan_don_hang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Session["OrderNumber"] != null)
        //    {
        //        var oOrder = new Orders();
        //        oOrder.OrdersQuickUpdate_PayStatusID(Session["OrderNumber"].ToString(), "2");
        //        Session["Cart"] = null;
        //        Session["CheckOut"] = null;
        //    }
        //    else
        //        Response.Redirect("~/gio-hang.aspx");
        //}

        if (Session["UserName"] != null)
        {
            string SECURE_SECRET = "";

            //if (Session["PaymentMethod"].ToString() == "onepaynd")
            //    SECURE_SECRET = "A3EFDFABA8653DF2342E8DAC29B51AF0";
            //else if (Session["PaymentMethod"].ToString() == "onepayqt")
            //    SECURE_SECRET = "6D0870CDE5F24F34F3915FB0045120DB";

            if (Session["PaymentMethod"].ToString() == "onepaynd")
                SECURE_SECRET = "04E8DA60020D93506DCC15B7F6A71D26";
            else if (Session["PaymentMethod"].ToString() == "onepayqt")
                SECURE_SECRET = "C7BB42E2BE08E07FDF7210CB381FA04A";

            string hashvalidateResult = "";
            // Khoi tao lop thu vien
            VPCRequest conn = new VPCRequest("http://onepay.vn");
            conn.SetSecureSecret(SECURE_SECRET);
            // Xu ly tham so tra ve va kiem tra chuoi du lieu ma hoa
            hashvalidateResult = conn.Process3PartyResponse(Page.Request.QueryString);
            // Lay gia tri tham so tra ve tu cong thanh toan
            String vpc_TxnResponseCode = conn.GetResultField("vpc_TxnResponseCode", "Unknown");
            string amount = conn.GetResultField("vpc_Amount", "Unknown");
            string localed = conn.GetResultField("vpc_Locale", "Unknown");
            string command = conn.GetResultField("vpc_Command", "Unknown");
            string version = conn.GetResultField("vpc_Version", "Unknown");
            string cardType = conn.GetResultField("vpc_Card", "Unknown");
            string orderInfo = conn.GetResultField("vpc_OrderInfo", "Unknown");
            string merchantID = conn.GetResultField("vpc_Merchant", "Unknown");
            string authorizeID = conn.GetResultField("vpc_AuthorizeId", "Unknown");
            string merchTxnRef = conn.GetResultField("vpc_MerchTxnRef", "Unknown");
            string transactionNo = conn.GetResultField("vpc_TransactionNo", "Unknown");
            string acqResponseCode = conn.GetResultField("vpc_AcqResponseCode", "Unknown");
            string txnResponseCode = vpc_TxnResponseCode;
            string message = conn.GetResultField("vpc_Message", "Unknown");
            var oOrders = new Orders();
            //var oOrderDetail = new OrderDetail();

            var dtCart = Session["Cart"] as DataTable;
            double Amount = 0, sAmount = 0;
            string LastName,
                   FirstName,
                   Address,
                   Email,
                   ProvinceCode,
                   DistrictName,
                   CountryName,
                   Phone,
                   AddressBookID;

            string OrderNumber = Session["OrderNumber"].ToString();
            var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
            var OrderStatusID = "1";
            var ShippingStatusID = "1";
            var PaymentMethodID = Session["PaymentMethod"].ToString();
            var Notes = Session["Message"].ToString();
            var Comission = "";
            var PaymentMethodName = Session["PaymentMethod"] == "money" ? "Tiền Mặt" : (Session["PaymentMethod"] == "onepaynd" ? "Thẻ ATM nội địa qua OnePay" : (Session["PaymentMethod"] == "onepayqt" ? "Thẻ VISA, MASTER qua OnePAY" : "Chuyển khoản trực tiếp"));

            var oAddressBook = new AddressBook();
            var dtAddressBook = oAddressBook.AddressBookSelectOne(Session["ShippingID"].ToString());

            AddressBookID = dtAddressBook.Rows[0]["AddressBookID"].ToString();
            LastName = dtAddressBook.Rows[0]["LastName"].ToString();
            FirstName = dtAddressBook.Rows[0]["FirstName"].ToString();
            Address = dtAddressBook.Rows[0]["Address1"].ToString();
            Email = dtAddressBook.Rows[0]["Email"].ToString();
            ProvinceCode = dtAddressBook.Rows[0]["ProvinceName"].ToString();
            CountryName = dtAddressBook.Rows[0]["CountryName"].ToString();
            DistrictName = dtAddressBook.Rows[0]["DistrictName"].ToString();
            Phone = dtAddressBook.Rows[0]["HomePhone"].ToString();

            var BillingAddressID = AddressBookID;
            var ShippingAddressID = AddressBookID;

            var ShippingPrice = Session["ShippingPrice"];


            var YourName = FirstName + " " + LastName;
            var YourEmail = Email;
            var YourAddress = Address + ", " + DistrictName + ", " + ProvinceCode + ", " + CountryName;

            var To = "hungtien408@gmail.com";
            //var To = "nhatquangth@gmail.com";
            var Subject = "Chúng tôi đã nhận được đơn hàng: " + OrderNumber;
            //var Host = "118.69.199.203";
            //int Port = 25;
            var Host = "smtp.gmail.com";
            int Port = 587;
            //var strMailFromAlias = "webmastersendmail2323@gmail.com";
            //var Password = "web123master";
            var strDisplayNameMailFrom = "";
            var From = "webmastersendmail0401@gmail.com";
            var sPassword = "web123master";
            //var strDisplayNameMailFrom = "Pandemos - Đặt Hàng";
            //var From = "customerservice@pandemos.vn";
            //var sPassword = "pandemos@2014";
            bool bEnableSSL = true;

            // Sua lai ham check chuoi ma hoa du lieu
            //if (recive_SecureHash !=doSecureHash)
            if (hashvalidateResult == "CORRECTED" && txnResponseCode.Trim() == "0")
            {
                //Common.ShowAlert(SECURE_SECRET);
                //string Host = "118.69.199.203";
                //int Port = 25;
                //string From = "customerservice@pandemos.vn";
                //string Password = "pandemos@2014";
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
                Body += "<p><b>* Phương thức thanh toán</b>: " + PaymentMethodName + "</p>";
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
                Body += "<p>Add: 403, Hai Bà Trưng, Phường 8, Quận 3, Tp HCM.</p>";
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
                    //oOrders.OrdersInsert1(
                    //    OrderNumber,
                    //    UserName,
                    //    OrderStatusID,
                    //    ShippingStatusID,
                    //    PaymentMethodID,
                    //    BillingAddressID,
                    //    ShippingAddressID,
                    //    Notes,
                    //    Comission,
                    //    "",
                    //    "",
                    //    YourAddress,
                    //    "",
                    //    Email
                    //    );

                    //foreach (DataRow dr in dtCart.Rows)
                    //{
                    //    string ProductID = dr["ProductID"].ToString();
                    //    string Quantity = dr["Quantity"].ToString();
                    //    string Price = dr["Price"].ToString();
                    //    string CreateBy = UserName;
                    //    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    //    string ProductLengthName = dr["ProductLengthName"].ToString();
                    //    string ProductName = dr["ProductName"].ToString();

                    //    oOrderDetail.OrderDetailInsert1(
                    //       OrderNumber,
                    //       ProductID,
                    //       Quantity,
                    //       Price,
                    //       CreateBy,
                    //       ProductOptionCategoryName,
                    //       ProductLengthName,
                    //       Email
                    //    );
                    //}
                    //OrderNumber = oOrders.OrderID;

                    oOrders.OrdersQuickUpdate_PayStatusID(
                        OrderNumber,
                        "1"
                        );
                }
                //Common.ShowAlert("Bạn đã đặt hàng thành công. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!");
                vpc_Result.Text = "Giao dịch đã thành công";
                Panel2.Visible = true;
                Session["Cart"] = null;
                Session["CheckOut"] = null;
            }
            else if (hashvalidateResult == "INVALIDATED" && txnResponseCode.Trim() == "0")
            {
                oOrders.OrdersQuickUpdate_PayStatusID(
                        OrderNumber,
                        "2"
                        );
                vpc_Result.Text = "Giao dịch đang chờ xử lý";
                Session["Cart"] = null;
                Session["CheckOut"] = null;
                //Response.Redirect("~/gio-hang.aspx");
            }
            else
            {
                oOrders.OrdersQuickUpdate_PayStatusID(
                        OrderNumber,
                        "3"
                        );
                vpc_Result.Text = "Giao dịch không thành công. Vui lòng tiến hành thanh toán lại";
                Session["Cart"] = null;
                Session["CheckOut"] = null;
                //Response.Redirect("~/gio-hang.aspx");
            }
        }
        else if (Session["Email"] != null)
        {
            string SECURE_SECRET = "";

            //if (Session["PaymentMethod"].ToString() == "onepaynd")
            //    SECURE_SECRET = "A3EFDFABA8653DF2342E8DAC29B51AF0";
            //else if (Session["PaymentMethod"].ToString() == "onepayqt")
            //    SECURE_SECRET = "6D0870CDE5F24F34F3915FB0045120DB";

            if (Session["PaymentMethod"].ToString() == "onepaynd")
                SECURE_SECRET = "04E8DA60020D93506DCC15B7F6A71D26";
            else if (Session["PaymentMethod"].ToString() == "onepayqt")
                SECURE_SECRET = "C7BB42E2BE08E07FDF7210CB381FA04A";

            string hashvalidateResult = "";
            // Khoi tao lop thu vien
            VPCRequest conn = new VPCRequest("http://onepay.vn");
            conn.SetSecureSecret(SECURE_SECRET);
            // Xu ly tham so tra ve va kiem tra chuoi du lieu ma hoa
            hashvalidateResult = conn.Process3PartyResponse(Page.Request.QueryString);
            // Lay gia tri tham so tra ve tu cong thanh toan
            String vpc_TxnResponseCode = conn.GetResultField("vpc_TxnResponseCode", "Unknown");
            string amount = conn.GetResultField("vpc_Amount", "Unknown");
            string localed = conn.GetResultField("vpc_Locale", "Unknown");
            string command = conn.GetResultField("vpc_Command", "Unknown");
            string version = conn.GetResultField("vpc_Version", "Unknown");
            string cardType = conn.GetResultField("vpc_Card", "Unknown");
            string orderInfo = conn.GetResultField("vpc_OrderInfo", "Unknown");
            string merchantID = conn.GetResultField("vpc_Merchant", "Unknown");
            string authorizeID = conn.GetResultField("vpc_AuthorizeId", "Unknown");
            string merchTxnRef = conn.GetResultField("vpc_MerchTxnRef", "Unknown");
            string transactionNo = conn.GetResultField("vpc_TransactionNo", "Unknown");
            string acqResponseCode = conn.GetResultField("vpc_AcqResponseCode", "Unknown");
            string txnResponseCode = vpc_TxnResponseCode;
            string message = conn.GetResultField("vpc_Message", "Unknown");

            var oOrders = new Orders();
            //var oOrderDetail = new OrderDetail();
            var dtCart = Session["Cart"] as DataTable;
            double Amount = 0, sAmount = 0;
            string LastName,
                   FirstName,
                   Address,
                   Email,
                   ProvinceCode,
                   DistrictName,
                   CountryName,
                   Phone,
                   AddressBookID;

            string OrderNumber = Session["OrderNumber"].ToString();
            var UserName = string.IsNullOrEmpty(User.Identity.Name) ? "" : User.Identity.Name;
            var OrderStatusID = "1";
            var ShippingStatusID = "1";
            var PaymentMethodID = Session["PaymentMethod"].ToString();
            var Notes = Session["Message"].ToString();
            var Comission = "";
            var PaymentMethodName = Session["PaymentMethod"] == "money" ? "Tiền Mặt" : (Session["PaymentMethod"] == "onepaynd" ? "Thẻ ATM nội địa qua OnePay" : (Session["PaymentMethod"] == "onepayqt" ? "Thẻ VISA, MASTER qua OnePAY" : "Chuyển khoản trực tiếp"));

            var oAddressBook1 = new AddressBook1();
            var dtAddressBook = oAddressBook1.AddressBook1SelectOne(Session["AddressBookID"].ToString());

            AddressBookID = dtAddressBook.Rows[0]["AddressBookID"].ToString();
            LastName = dtAddressBook.Rows[0]["LastName"].ToString();
            FirstName = dtAddressBook.Rows[0]["FirstName"].ToString();
            Address = dtAddressBook.Rows[0]["Address1"].ToString();
            Email = dtAddressBook.Rows[0]["Email"].ToString();
            ProvinceCode = dtAddressBook.Rows[0]["ProvinceName"].ToString();
            CountryName = dtAddressBook.Rows[0]["CountryName"].ToString();
            DistrictName = dtAddressBook.Rows[0]["DistrictName"].ToString();
            Phone = dtAddressBook.Rows[0]["HomePhone"].ToString();

            var BillingAddressID = AddressBookID;
            var ShippingAddressID = AddressBookID;

            var ShippingPrice = Session["ShippingPrice"];


            var YourName = FirstName + " " + LastName;
            var YourEmail = Email;
            var YourAddress = Address + ", " + DistrictName + ", " + ProvinceCode + ", " + CountryName;

            //var To = "sales@pandemos.vn";
            var To = "hungtien408@gmail.com";
            var Subject = "Chúng tôi đã nhận được đơn hàng: " + OrderNumber;
            //var Host = "118.69.199.203";
            //int Port = 25;
            var Host = "smtp.gmail.com";
            int Port = 587;
            //var strMailFromAlias = "webmastersendmail2323@gmail.com";
            //var Password = "web123master";
            var strDisplayNameMailFrom = "";
            var From = "webmastersendmail0401@gmail.com";
            var sPassword = "web123master";
            //var strDisplayNameMailFrom = "Pandemos - Đặt Hàng";
            //var From = "customerservice@pandemos.vn";
            //var sPassword = "pandemos@2014";
            bool bEnableSSL = true;
            // Sua lai ham check chuoi ma hoa du lieu
            //if (recive_SecureHash !=doSecureHash)
            if (hashvalidateResult == "CORRECTED" && txnResponseCode.Trim() == "0")
            {
                //Common.ShowAlert(SECURE_SECRET);

                //string Host = "118.69.199.203";
                //int Port = 25;
                //string From = "customerservice@pandemos.vn";
                //string Password = "pandemos@2014";
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
                Body += "<p><b>* Phương thức thanh toán</b>: " + PaymentMethodName + "</p>";
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
                Body += "<p>Add: 403, Hai Bà Trưng, Phường 8, Quận 3, Tp HCM.</p>";
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
                    //oOrders.OrdersInsert1(
                    //    OrderNumber,
                    //    UserName,
                    //    OrderStatusID,
                    //    ShippingStatusID,
                    //    PaymentMethodID,
                    //    BillingAddressID,
                    //    ShippingAddressID,
                    //    Notes,
                    //    Comission,
                    //    "",
                    //    "",
                    //    YourAddress,
                    //    "",
                    //    Email
                    //    );

                    //foreach (DataRow dr in dtCart.Rows)
                    //{
                    //    string ProductID = dr["ProductID"].ToString();
                    //    string Quantity = dr["Quantity"].ToString();
                    //    string Price = dr["Price"].ToString();
                    //    string CreateBy = UserName;
                    //    string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                    //    string ProductLengthName = dr["ProductLengthName"].ToString();
                    //    //string ProductName = dr["ProductName"].ToString();

                    //    oOrderDetail.OrderDetailInsert1(
                    //       OrderNumber,
                    //       ProductID,
                    //       Quantity,
                    //       Price,
                    //       CreateBy,
                    //       ProductOptionCategoryName,
                    //       ProductLengthName,
                    //       Email
                    //    );
                    //}
                    //OrderNumber = oOrders.OrderID;

                    oOrders.OrdersQuickUpdate_PayStatusID(
                        OrderNumber,
                        "1"
                        );
                }
                //Common.ShowAlert("Bạn đã đặt hàng thành công. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!");
                vpc_Result.Text = "Giao dịch đã thành công";
                Panel2.Visible = true;
                Session["Cart"] = null;
                Session["CheckOut"] = null;
            }
            else if (hashvalidateResult == "INVALIDATED" && txnResponseCode.Trim() == "0")
            {
                oOrders.OrdersQuickUpdate_PayStatusID(
                       OrderNumber,
                       "2"
                       );
                vpc_Result.Text = "Giao dịch đang chờ xử lý";
                Session["Cart"] = null;
                Session["CheckOut"] = null;
                //Response.Redirect("~/gio-hang.aspx");
            }
            else
            {
                oOrders.OrdersQuickUpdate_PayStatusID(
                       OrderNumber,
                       "3"
                       );
                vpc_Result.Text = "Giao dịch không thành công. Vui lòng tiến hành thanh toán lại";
                Session["Cart"] = null;
                Session["CheckOut"] = null;
                //Response.Redirect("~/gio-hang.aspx");
            }
        }
        else
            Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);
    }
}