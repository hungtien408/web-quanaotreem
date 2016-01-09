using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lien_he : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblMessage.Visible = false;
    }
    private void sendEmail()
    {
        //string msg = "<h3>CÔNG TY TNHH THƯƠNG MẠI - XUẤT KHẨU SONG KIM LONG HẢI: LIÊN HỆ</h3><br/>";
        //msg += "<b>Họ và tên: </b>" + txtHoTen.Text.Trim().ToString() + "<br />";
        //msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        //msg += "<b>Điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        //msg += "<b>Nội dung: </b>" + txtNoiDung.Text.Trim().ToString();
        //Common.SendMail("118.69.193.238", 25, "webmaster@thietkewebhcm.com", "web123master", "songkimlonghai@gmail.com", "", "LIÊN HỆ CÔNG TY TNHH THƯƠNG MẠI - XUẤT KHẨU SONG KIM LONG HẢI", msg, false);
    }
    protected void btGui_Click(object sender, EventArgs e)
    {
        //if (Page.IsValid)
        //{
        //    if (MyCaptcha1.IsValid)
        //    {

        //        //send email         
        //        sendEmail();
        //        lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
        //        lblMessage.Visible = true;
        //        lblCheckResult.Text = "";
        //        //
        //        //Clear text
        //        //
        //        txtHoTen.Text = "";
        //        txtPhone.Text = "";
        //        txtEmail.Text = "";
        //        txtNoiDung.Text = "";
        //    }
        //    else
        //    {
        //        lblCheckResult.Text = "Chuỗi xác nhận chưa đúng !";
        //    }
        //}
    }
}