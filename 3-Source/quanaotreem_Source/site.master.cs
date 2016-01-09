using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using TLLib;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("san-pham.aspx?ci=") || page.Contains("chi-tiet-san-pham.aspx?pi="))
                activePage = "san-pham.aspx";
            else if (page.Contains("chi-tiet-tin-tuc.aspx?id="))
                activePage = "tin-tuc.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;

            if (Session["IsLogin"] == null)
            {
                lnkLogout.Visible = false;
            }
            else
            {
                lnkLogout.Visible = true;
            }
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
    protected void btnNewLetter_Click(object sender, EventArgs e)
    {
        if (txtNewLetter.Text != "")
        {
            new TLLib.Newsletter().NewsletterInsert(txtNewLetter.Text.ToString().Trim());
        }
        txtNewLetter.Text = "";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw= " + txtSearch.Text.Trim());
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session["IsLogin"] = null;
        Session["UserName"] = null;
        FormsAuthentication.SignOut();
        Response.Redirect(Page.Request.Url.AbsolutePath);
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
        {
            var oShoppingCart = new ShoppingCart();
            var dt = oShoppingCart.Cart();
            if (dt.Rows.Count == 0)
            {
                lblSummary.Text = "0";
            }
            else
            {
                int quantity = 0;
                double Total = 0;
                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    quantity += int.Parse(dt.Rows[i]["Quantity"].ToString());
                //}

                foreach (DataRow dr in dt.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? "0" : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    Total += Quantity * Price;
                    quantity += Quantity;
                }
                lblSummary.Text = quantity.ToString();
                //lblTotalPrice.Text = string.Format("{0:##,###.##}", Total).Replace('.', '*').Replace(',', '.').Replace('*', ',') + "đ";
            }
        }
        if (Session["IsLogin"] != null)
        {
            var oWishList = new WishList();
            var dv = oWishList.WishListSelectAll("", "", Session["UserName"].ToString(), "", "", "", "").DefaultView;
            //lblWishList.Text = dv.Count.ToString();
        }
    }
}
