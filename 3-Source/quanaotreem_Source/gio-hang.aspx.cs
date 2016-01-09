using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class gio_hang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cart"] != null)
                pnlbutton.Visible = true;
            Session["IsGuest"] = null;
            Session["Email"] = null;
        }
    }
    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            var lblTotalPrice = ListView1.FindControl("lblTotalPrice") as Label;
            var hdnTotalPrice = ListView1.FindControl("hdnTotalPrice") as HiddenField;

            var lblSumTotalPrice = ListView1.FindControl("lblSumTotalPrice") as Label;
            var hdnSumTotalPrice = ListView1.FindControl("hdnSumTotalPrice") as HiddenField;
            var lblShippingPrice = ListView1.FindControl("lblShippingPrice") as Label;


            var hdnShippingPrice = ListView1.FindControl("hdnShippingPrice") as HiddenField;

            var iShippingPrice = "0";// Convert.ToDouble(string.IsNullOrEmpty(dv[0]["ShippingPrice"].ToString()) ? "0" : dv[0]["ShippingPrice"].ToString());
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
                //ShippingPrice = 20000;
                SumTotalPrice = TotalPrice + ShippingPrice;
                hdnTotalPrice.Value = TotalPrice.ToString();
                hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                lblTotalPrice.Text = string.IsNullOrEmpty(TotalPrice.ToString()) ? "<strong>0</strong> vnđ" : "<strong>" + (string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> vnđ";
                lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> vnđ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> vnđ";
                lblShippingPrice.Text = iShippingPrice.ToString() == "0" ? "<strong>0</strong> vnđ" : "<strong>" + (string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> vnđ";
                hdnShippingPrice.Value = ShippingPrice.ToString();
            }
        }
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        if (cmd == "Remove")
        {
            var ProductID = (item.FindControl("hdnCartProductID") as HiddenField).Value;
            var ProductOptionCategoryID = (item.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
            var ProductLengthID = (item.FindControl("hdnCartProductLengthID") as HiddenField).Value;

            var oShoppingCart = new ShoppingCart();
            oShoppingCart.DeleteItem(ProductID, ProductOptionCategoryID, ProductLengthID);
            ListView1.DataBind();
        }
    }

    protected void lkbUpdate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            //if (ddlCity.SelectedValue != "0")
            //{
            var oShoppingCart = new ShoppingCart();
            if (Page.IsValid)
            {
                if (Session["Cart"] != null)
                {
                    var dtCart = Session["Cart"] as DataTable;
                    if (dtCart.Rows.Count != 0)
                    {
                        Session["OrderNumber"] = Guid.NewGuid().GetHashCode().ToString("X");

                        int Quantity = 0;
                        double TotalPrice = 0;
                        foreach (DataRow dr in dtCart.Rows)
                        {
                            string ProductID = dr["ProductID"].ToString();
                            string ProductName = dr["ProductName"].ToString();
                            string MaSanPham = dr["Tag"].ToString();
                            Quantity = Convert.ToInt32(dr["Quantity"].ToString());
                            var Price = Convert.ToInt32(dr["Price"].ToString());
                            TotalPrice += Quantity*Price;
                        }
                        Session["thanhtien"] = TotalPrice;
                        Session["Quantity"] = Quantity;
                        Session["tongtien"] = TotalPrice;
                        var ShippingPrice = ListView1.FindControl("hdnShippingPrice") as HiddenField;
                        Session["ShippingPrice"] = ShippingPrice.Value;
                    }
                }

                Session["GiaoHang"] = "true";
                if (Session["IsLogin"] != null)
                {
                    string UserName = Page.User.Identity.Name;
                    string[] roleUser = Roles.GetRolesForUser(UserName.ToString());
                    for (int i = 0; i < roleUser.Length; i++)
                    {
                        if (roleUser[i] == "customer")
                        {

                            Response.Redirect("thong-tin-thanh-toan.aspx");
                        }
                        else
                        {
                            Response.Redirect("Login.aspx");
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }
    }

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        var textbox = (TextBox)sender;
        var parent = textbox.NamingContainer;

        var oShoppingCart = new ShoppingCart();

        var Quantity = (parent.FindControl("txtQuantity") as TextBox).Text.Trim();
        var ProductID = (parent.FindControl("hdnCartProductID") as HiddenField).Value;
        var ProductOptionCategoryID = (parent.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
        var ProductLengthID = (parent.FindControl("hdnCartProductLengthID") as HiddenField).Value;
        int Quantity1 = Int32.Parse(Quantity);
        if (Quantity1 > 0 && Quantity1 < 12)
        {
            oShoppingCart.UpdateQuantity(ProductID,ProductLengthID, ProductOptionCategoryID, Quantity);
            ListView1.DataBind();
        }
        else
        {
            Quantity = "1";
            ScriptManager.RegisterClientScriptBlock((TextBox)sender, sender.GetType(), "runtime", "alert('Bạn nhập quá số lượng cho phép (1 - 12)')", true);
        }
    }
}