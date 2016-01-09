using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class san_pham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsProduct.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }

            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pci"]))
            {
                var oProductCategory = new ProductCategory();
                var dv = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                //hdnSanPham.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Sản phẩm";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
            lblTitle2.Text = strTitle;
            lblTitle3.Text = strTitle;
            lblTitle4.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }

    protected void lstProduct_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = (item.FindControl("hdnProductOptionCategoryID") as HiddenField).Value;
        var ProductOptionCategoryName = (item.FindControl("hdnProductOptionCategoryName") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName") as Label).Text;
        var ProductNameEn = (item.FindControl("lblProductNameEn") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode") as HiddenField).Value;
        var ProductLengthID = (item.FindControl("hdnProductLengthID") as HiddenField).Value;
        var ProductLengthName = (item.FindControl("hdnProductLengthName") as HiddenField).Value;
        var Quantity = "1";
        double Price = Convert.ToDouble((item.FindControl("hdnPrice") as HiddenField).Value);
        string ProductSizeColorID1 = "";
        string QuantityList = "";
        int SizeColorQuantity1 = 0;
        var oProductSizeColor = new ProductSizeColor();
        if (cmd == "AddToCart")
        {
            if (ProductID != "" && ProductLengthID != "" && ProductLengthID != "")
            {
                var dv = oProductSizeColor.ProductSizeColorSelectAll(ProductLengthID, ProductOptionCategoryID, ProductID, "True",
                                                                 "True", "", "True").DefaultView;
                ProductSizeColorID1 = dv[0]["ProductSizeColorID"].ToString();
                SizeColorQuantity1 = Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());
                for (int i = 1; i <= SizeColorQuantity1; i++)
                {
                    QuantityList = QuantityList + i + ",";
                }
            }
            var oShoppingCart = new ShoppingCart();
            oShoppingCart.CreateCart(ProductID,
                ImageName,
                ProductName,
                ProductNameEn,
                ProductCode,
                ProductOptionCategoryID,
                ProductOptionCategoryName,
                ProductLengthID,
                ProductLengthName,
                ProductSizeColorID1,
                Quantity,
                SizeColorQuantity1.ToString(),
                Price,
                false
                );
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "myconfirmPopup('" + "<strong>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + "</strong><br/> đã được thêm vào giỏ hàng" + "')", true);
        }
        else if (cmd == "AddToWishList")
        {
            if (Session["UserName"] != null)
            {
                var oWishList = new WishList();
                oWishList.WishListInsert1(
                    ProductID,
                    User.Identity.Name,
                    "1",
                    Price.ToString(),
                    ImageName,
                    ProductName,
                    "",
                    ProductCode,
                    ProductOptionCategoryID,
                    ProductOptionCategoryName,
                    ProductLengthID,
                    ProductLengthName,
                    ProductSizeColorID1,
                    ""
                    );
            }
            else
                Response.Redirect("~/Login.aspx?returnurl=" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1));
        }
    }
}