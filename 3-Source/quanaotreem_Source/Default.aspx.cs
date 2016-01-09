using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
    protected void lstProductNew_ItemCommand(object sender, ListViewCommandEventArgs e)
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
    protected void lstProductHot_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = (item.FindControl("hdnProductOptionCategoryID2") as HiddenField).Value;
        var ProductOptionCategoryName = (item.FindControl("hdnProductOptionCategoryName2") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID2") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName2") as Label).Text;
        var ProductNameEn = (item.FindControl("lblProductNameEn2") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName2") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode2") as HiddenField).Value;
        var ProductLengthID = (item.FindControl("hdnProductLengthID2") as HiddenField).Value;
        var ProductLengthName = (item.FindControl("hdnProductLengthName2") as HiddenField).Value;
        var Quantity = "1";
        double Price = Convert.ToDouble((item.FindControl("hdnPrice2") as HiddenField).Value);
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
    protected void lstProductBoy_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = (item.FindControl("hdnProductOptionCategoryID3") as HiddenField).Value;
        var ProductOptionCategoryName = (item.FindControl("hdnProductOptionCategoryName3") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID3") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName3") as Label).Text;
        var ProductNameEn = (item.FindControl("lblProductNameEn3") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName3") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode3") as HiddenField).Value;
        var ProductLengthID = (item.FindControl("hdnProductLengthID3") as HiddenField).Value;
        var ProductLengthName = (item.FindControl("hdnProductLengthName3") as HiddenField).Value;
        var Quantity = "1";
        double Price = Convert.ToDouble((item.FindControl("hdnPrice3") as HiddenField).Value);
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
    protected void lstProductGirl_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = (item.FindControl("hdnProductOptionCategoryID4") as HiddenField).Value;
        var ProductOptionCategoryName = (item.FindControl("hdnProductOptionCategoryName4") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID4") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName4") as Label).Text;
        var ProductNameEn = (item.FindControl("lblProductNameEn4") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName4") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode4") as HiddenField).Value;
        var ProductLengthID = (item.FindControl("hdnProductLengthID4") as HiddenField).Value;
        var ProductLengthName = (item.FindControl("hdnProductLengthName4") as HiddenField).Value;
        var Quantity = "1";
        double Price = Convert.ToDouble((item.FindControl("hdnPrice4") as HiddenField).Value);
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