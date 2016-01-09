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
        if (!IsPostBack)
        {
            if (Session["OrderNumber"] != null)
            {
                var oOrder = new Orders();
                oOrder.OrdersQuickUpdate_PayStatusID(Session["OrderNumber"].ToString(), "2");
                Session["Cart"] = null;
                Session["CheckOut"] = null;
            }
            else
                Response.Redirect("~/gio-hang.aspx");
        }
    }
}