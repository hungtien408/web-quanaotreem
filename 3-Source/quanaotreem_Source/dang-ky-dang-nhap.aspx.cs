using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using TLLib;

public partial class dang_ky_dang_nhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
        }
    }
    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        var txtEmail = (TextBox)sender;
        var strEmail = txtEmail.Text;
        //var CustomValidator2 = (CustomValidator)txtEmail.Parent.FindControl("CustomValidator2");
        //var lblMessage = (Label)txtEmail.Parent.FindControl("lblEmailMessage");

        if (!string.IsNullOrEmpty(strEmail))
        {
            if (Membership.FindUsersByEmail(strEmail).Count > 0)
            {
                CustomValidator2.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> đã tồn tại!";
                CustomValidator2.IsValid = false;
                lblEmailMessage.Text = "";
            }
            else
            {
                string[] stringArray = strEmail.Split(Convert.ToChar(";"));
                foreach (string s in stringArray)
                {
                    if (!Regex.IsMatch(s, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
                    {
                        CustomValidator1.IsValid = false;
                        CustomValidator1.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> sai định dạng email.";
                        lblEmailMessage.Text = "";
                    }
                    else
                    {
                        CustomValidator2.IsValid = true;
                        //CustomValidator2.ForeColor = Color.Green;
                        CustomValidator1.IsValid = true;
                        lblEmailMessage.Text = "Email <b>\"" + strEmail + "\"</b> có thể sử dụng.";
                    }
                }
            }
        }
        else
            lblEmailMessage.Text = "";
    }

    protected void btnOrderNoRegister_Click(object sender, EventArgs e)
    {
        var Email = txtEmailNoRegister.Text.Trim();
        Session["Email"] = Email;
        Session["IsGuest"] = "True";
        if (Request.QueryString["ReturnURL"] != null)
            Response.Redirect(Request.QueryString["ReturnURL"]);
        else
            Response.Redirect("thong-tin-thanh-toan.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var oAddressBook = new AddressBook();
            var FirstName = txtFullName.Text.Trim();
            var LastName = "";
            var Email = txtEmailRegister.Text.Trim();
            var HomePhone = txtPhone.Text.Trim();
            var CellPhone = "";
            var Fax = "";
            //var ReceiveEmail = chkNewLetter.Checked.ToString();
            //var ReceiveEmail = "";
            var UserName = txtEmailRegister.Text.Trim();
            var Password = txtPasswordRegister.Text.Trim();
            var Company = "";
            var Address1 = txtAddress.Text.Trim();
            var Address2 = "";
            var ZipCode = "";
            //var City = txtCity.Text.Trim();
            var City = "";
            var CountryID = "1";
            var ProvinceID = ddlProvince.SelectedValue;
            var DistrictID = ddlDistrict.SelectedValue;
            var IsPrimary = "True";
            var IsPrimaryBilling = "True";
            var IsPrimaryShipping = "True";
            var RoleName = "customer";
            //var Gender = rdbGender.SelectedValue;
            DateTime strDateOfBirth = new DateTime(Convert.ToInt32(ddlYear.SelectedItem.Text),
                Convert.ToInt32(ddlMonth.SelectedItem.Text), Convert.ToInt32(ddlDay.SelectedItem.Text));
            string Birthday = strDateOfBirth.ToString("MM/dd/yyyy");
            bool bError = false;
            if (!string.IsNullOrEmpty(UserName))
            {
                if (Membership.GetUser(UserName) != null)
                {
                    CustomValidator2.ErrorMessage = "<b>+ Tên truy cập " + UserName +
                                                    " đã được đăng ký sử dụng, vui lòng chọn tên khác</b>";
                    CustomValidator2.IsValid = false;
                    bError = true;
                }
                else
                    CustomValidator2.IsValid = true;
            }
            if (!bError)
            {
                Membership.CreateUser(UserName, Password, Email);
                Roles.AddUserToRole(UserName, RoleName);
                //var oUser = new User();
                //oUser.UserInsert(UserName, Password, Email, Role);
                oAddressBook.AddressBookInsert1(
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
                if (ckbNewsletter.Checked)
                {
                    var oNewletter = new Newsletter();
                    oNewletter.NewsletterInsert(Email);
                }
                FormsAuthentication.SetAuthCookie(UserName, true);
                //pnlSuccess.Visible = true;
                Session["UserName"] = UserName;
                ////var CC = "order@pandemos.vn";
                //var Subject = "Đăng ký tài khoản thành công/Thanks for Registering";
                ////var OrderCode = OrderID;
                //string Host = "118.69.199.203";
                //int Port = 25;
                //string From = "customerservice@pandemos.vn";
                //string mPassword = "pandemos@2014";
                //string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                //Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>";
                //Body += "Cảm ơn bạn đã đăng ký tài khoản/Thanks for Registering";
                //Body += "</h3>";
                //Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'>";
                //Body += "<p>Xin chào " + FirstName + "/Hi " + FirstName + ",</p>";
                //Body += "<p>Cảm ơn bạn đã đăng ký tài khoản tại EZStore/ Many thanks for registering at EZStore</p>";
                //Body += "<p>Thông tin đăng nhập của bạn như sau/ Your login detail is as follow:</p>";
                //Body += "<p>Email: <b>" + Email + "</b></p>";
                //Body += "<p>Mật khẩu/Password: <b>" + Password + "</b></p>";
                //Body += "<p>Mọi thắc mắc, xin vui lòng liên hệ với chúng tôi qua email: <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a> /If you have any enquiries, please email us on <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a></p>";
                //Body += "<p>Chúc bạn có những thời khắc ngọt ngào với EZStore/ We hope you have great expericences with EZStore</p>";
                //Body += "</div>";
                //Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                //Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                //Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>EZStore</h4>";
                //Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                //Body += "<p>Add: 403, Hai Bà Trưng , P.8, Quận 3, HCM</p>";
                //Body += "<p>Tel: (08)3 820 8577 - Hotline: 0902 563 577</p>";
                ////Body += "<p>M: +84 908 xxx xxx>";

                //Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                //Body += "<p>E: <a href='mailto:info@pandemos.vn'>info@pandemos.vn</a></p>";
                //Body += "</div>";
                //Body += "</div>";
                //Body += "</div>";
                //Common.SendMail(Host, Port, From, mPassword, Email, "", Subject, Body, false);

                //txtUserNameRegister.Text =
                txtAddress.Text =
                    txtEmailRegister.Text =
                        txtFullName.Text =
                            txtPasswordRegister.Text =
                    //txtVerifyCode.Text =
                                txtConfirmPassWordRegister.Text = "";
                ddlYear.SelectedIndex = ddlDay.SelectedIndex = ddlMonth.SelectedIndex = -1;
                lblEmailMessage.Text = "";
                ckbSuccess.Checked = false;
                ckbNewsletter.Checked = false;
                //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "alert('Bạn đã đăng ký thành công!')", true);
                Response.Redirect("~/dang-ky-dang-nhap.aspx");
            }
        }
    }

    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        string UserName = Login1.UserName;
        MembershipUser mu = Membership.GetUser(UserName);
        //Session["PWD"] = Login1.Password;
        if (UserName != null)
        {
            string[] roleUser = Roles.GetRolesForUser(UserName.ToString());
            for (int i = 0; i < roleUser.Length; i++)
            {

                if (roleUser[i] == "admin")
                {
                    Response.Redirect("ad/bilingual/");
                }
                else if (roleUser[i] == "customer")
                {
                    Session["UserName"] = Login1.UserName;
                    //var dv = new TLLib.UserProfile().UserProfileSelectOne(Login1.UserName).DefaultView;
                    //if (dv.Count > 0)
                    //{
                    //    Session["TenKH"] = dv[0]["FirstName"];
                    //}
                    Session["GiaoHang"] = "true";
                    Session["IsLogin"] = "true";
                    Session["ThongTin"] = "true";
                    Response.Redirect("thong-tin-tai-khoan.aspx");
                }
                else
                {
                    Response.Redirect("ad/member/ongoing-project.aspx");
                }
            }
        }
    }
}