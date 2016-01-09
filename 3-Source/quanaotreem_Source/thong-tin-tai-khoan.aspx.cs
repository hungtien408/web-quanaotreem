using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class thong_tin_tai_khoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);
            else
                OdsAddressBook.SelectParameters["UserName"].DefaultValue = User.Identity.Name;

            var ddlYear = FormView1.FindControl("ddlYear") as DropDownList;
            var ddlMonth = FormView1.FindControl("ddlMonth") as DropDownList;
            var ddlDay = FormView1.FindControl("ddlDay") as DropDownList;

            //if (Session["UserName"] != null || Session["Email"] != null)
            //Response.Redirect("~/gio-hang.aspx");
        }
    }
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        var ProvinceID = FormView1.FindControl("hdnProvinceID") as HiddenField;
        var ddlProvince = FormView1.FindControl("ddlProvince") as DropDownList;
        var DistrictID = FormView1.FindControl("hdnDistrictID") as HiddenField;
        var ddlDistrict = FormView1.FindControl("ddlDistrict") as DropDownList;
        var ddlYear = FormView1.FindControl("ddlYear") as DropDownList;
        var ddlMonth = FormView1.FindControl("ddlMonth") as DropDownList;
        var ddlDay = FormView1.FindControl("ddlDay") as DropDownList;
        var Birthday = FormView1.FindControl("hdnBirthday") as HiddenField;
        if (!string.IsNullOrEmpty(Birthday.Value.ToString()))
        {
            DateTime iBirthday = DateTime.Parse(string.IsNullOrEmpty(Birthday.Value) ? "" : Birthday.Value);
            var iYear = iBirthday.Year.ToString();
            var iMonth = iBirthday.Month.ToString();
            var iDay = iBirthday.Day.ToString();
            var rdbGender = FormView1.FindControl("rdbGender") as RadioButtonList;
            var hdnGender = FormView1.FindControl("hdnGender") as HiddenField;

            int currentyear = DateTime.Now.Year - 18;
            ddlYear.Items.Add(new ListItem("- Năm -", ""));
            for (int i = currentyear; i >= 1960; i--)
            {
                ddlYear.Items.Add(new ListItem(i.ToString()));
            }
            //int currentmonth = DateTime.Now.Month;
            int currentmonth = 1;
            ddlMonth.Items.Add(new ListItem("- Tháng - ", ""));
            for (int i = currentmonth; i <= 12; i++)
            {
                ddlMonth.Items.Add(new ListItem(i.ToString()));
            }
            //int currentday = DateTime.Now.Day;
            int currentday = 1;
            ddlDay.Items.Add(new ListItem("- Ngày - ", ""));
            for (int i = currentday; i <= 31; i++)
            {
                ddlDay.Items.Add(new ListItem(i.ToString()));
            }
            if (!string.IsNullOrEmpty(ProvinceID.Value))
                ddlProvince.SelectedValue = ProvinceID.Value;
            if (!string.IsNullOrEmpty(DistrictID.Value))
                ddlDistrict.SelectedValue = DistrictID.Value;
            if (!string.IsNullOrEmpty(iYear))
                ddlYear.SelectedValue = iYear;
            if (!string.IsNullOrEmpty(iMonth))
                ddlMonth.SelectedValue = iMonth;
            if (!string.IsNullOrEmpty(iDay))
                ddlDay.SelectedValue = iDay;
        }

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        var ddlYear = FormView1.FindControl("ddlYear") as DropDownList;
        var ddlMonth = FormView1.FindControl("ddlMonth") as DropDownList;
        var ddlDay = FormView1.FindControl("ddlDay") as DropDownList;
        var ddlProvince = FormView1.FindControl("ddlProvince") as DropDownList;
        var ddlDistrict = FormView1.FindControl("ddlDistrict") as DropDownList;
        var rdbGender = FormView1.FindControl("rdbGender") as RadioButtonList;
        var txtFullName = FormView1.FindControl("txtFullName") as TextBox;
        //var txtEmailRegister = FormView1.FindControl("txtEmailRegister") as TextBox;
        var txtPhone = FormView1.FindControl("txtPhone") as TextBox;
        //var txtPasswordRegister = FormView1.FindControl("txtPasswordRegister") as TextBox;
        var txtAddress = FormView1.FindControl("txtAddress") as TextBox;
        var hdnAddressBookID = FormView1.FindControl("hdnAddressBookID") as HiddenField;
        var lblEmail = FormView1.FindControl("lblEmail") as Label;

        var oAddressBook = new AddressBook();
        var AddressBookID = hdnAddressBookID.Value;
        var FirstName = txtFullName.Text.Trim();
        var LastName = "";
        var Email = lblEmail.Text.Trim();
        var HomePhone = txtPhone.Text.Trim();
        var CellPhone = "";
        var Fax = "";
        var UserName = lblEmail.Text.Trim();
        //var Password = txtPasswordRegister.Text.Trim();
        var Company = "";
        var Address1 = txtAddress.Text.Trim();
        var Address2 = "";
        var ZipCode = "";
        var City = "";
        var CountryID = "1";
        var ProvinceID = ddlProvince.SelectedValue;
        var DistrictID = ddlDistrict.SelectedValue;
        var IsPrimary = "True";
        var IsPrimaryBilling = "True";
        var IsPrimaryShipping = "True";
        var RoleName = "customer";

        DateTime strDateOfBirth = new DateTime(Convert.ToInt32(ddlYear.SelectedItem.Text), Convert.ToInt32(ddlMonth.SelectedItem.Text), Convert.ToInt32(ddlDay.SelectedItem.Text));
        string Birthday = strDateOfBirth.ToString("MM/dd/yyyy");

        oAddressBook.AddressBookUpdate1(
            AddressBookID,
            FirstName,
            LastName,
            Email,
            HomePhone,
            CellPhone,
            Fax,
            //ReceiveEmail,
            UserName,
            Company,
            Address1,
            Address2,
            ZipCode,
            City,
            CountryID,
            ProvinceID,
            DistrictID,
            IsPrimary,
            IsPrimaryBilling,
            IsPrimaryShipping,
            RoleName,
            "",
            Birthday
            );
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "myconfirmPopupNew('Bạn đã cập nhật thành công!')", true);
    }
}