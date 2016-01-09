<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="thong-tin-thanh-toan.aspx.cs" Inherits="thong_tin_thanh_toan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div id="site">
            <a id="A1" href="~" runat="server"><span class="fa fa-home"></span></a>&raquo; <span>
                Giỏ hàng</span>
        </div>
        <div class="wrapper-cart">
            <ul id="menu-control">
                <li>
                    <div class="box-me corner">
                        <div class="me-name">
                            Giỏ hàng</div>
                    </div>
                </li>
                <li>
                    <div class="box-me corner">
                        <div class="me-name">
                            Đăng ký<br />
                            Đăng nhập</div>
                    </div>
                </li>
                <li class="active">
                    <div class="box-me corner">
                        <div class="me-name">
                            Thông tin<br />
                            thanh toán</div>
                    </div>
                </li>
                <li class="last">
                    <div class="box-me corner">
                        <div class="me-name">
                            Xác nhận<br />
                            đơn hàng</div>
                    </div>
                </li>
            </ul>
            <div id="box-content">
                <div class="section-cart info-buy">
                    <div class="addres-info box-left">
                        <h2 class="tit-tb">
                            Địa chỉ giao hàng</h2>
                        <asp:Panel ID="pnlInformationNoLogin" runat="server">
                            <div class="form-info">
                                <div class="info-input">
                                    <label class="info-lb">
                                        Họ và tên</label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtFullName1" CssClass="info-textbox" runat="server" Text=""></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtFullName_WatermarkExtender" runat="server" Enabled="True"
                                            WatermarkText="-- Họ và tên --" TargetControlID="txtFullName1">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                            Display="Dynamic" ValidationGroup="Information" ControlToValidate="txtFullName1"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Điện thoại</label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtPhone1" CssClass="info-textbox" runat="server" Text=""></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                                            WatermarkText="-- Điện thoại --" TargetControlID="txtPhone1">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                            Display="Dynamic" ValidationGroup="Information" ControlToValidate="txtPhone1"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Email</label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtEmail1" CssClass="info-textbox" runat="server" Text=""></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtEmailNoRegister_WatermarkExtender" runat="server"
                                            Enabled="True" WatermarkText="-- Email nhận thông tin khuyến mãi --" TargetControlID="txtEmail1">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                            runat="server" ValidationGroup="Information" ControlToValidate="txtEmail1" ErrorMessage="Sai định dạng email!"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                            ValidationGroup="Information" ControlToValidate="txtEmail1" ErrorMessage="Thông tin bắt buộc!"
                                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Địa chỉ giao hàng</label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtAddress1" CssClass="info-textbox" runat="server" Text=""></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="True"
                                            WatermarkText="-- Địa chỉ giao hàng --" TargetControlID="txtAddress1">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                            Display="Dynamic" ValidationGroup="Information" ControlToValidate="txtAddress1"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Tỉnh/ Thành phố</label>
                                    <div class="info-text">
                                        <asp:DropDownList ID="ddlProvince1" AutoPostBack="true" Enabled="False" DataSourceID="OdsProvince"
                                            DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="selectb" runat="server">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OdsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                            TypeName="TLLib.Province">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProvinceID" Type="String" />
                                                <asp:Parameter Name="ProvinceName" Type="String" />
                                                <asp:Parameter Name="ShortName" Type="String" />
                                                <asp:Parameter Name="CountryID" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb">
                                        Quận/ Huyện</label>
                                    <div class="info-text">
                                        <asp:DropDownList ID="ddlDistrict1" DataSourceID="OdsDistrict" DataTextField="DistrictName"
                                            DataValueField="DistrictID" CssClass="selectb" runat="server">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OdsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                            TypeName="TLLib.District">
                                            <SelectParameters>
                                                <asp:Parameter Name="DistrictName" Type="String" />
                                                <asp:ControlParameter ControlID="ddlProvince1" Name="ProvinceIDs" PropertyName="SelectedValue"
                                                    Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb info-l16">
                                        Ghi chú</label>
                                    <div class="info-text">
                                        <asp:TextBox ID="txtMessage1" CssClass="info-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <label class="info-lb info-l16">
                                        Điều khoàn mua hàng</label>
                                    <div class="info-text">
                                        <div class="description">
                                            <p>
                                                Cám ơn quý khách đã truy cập vào website MẮT KÍNH.VN được vận hành bởi SUSTAINABILITY
                                                CO. Chúng tôi tôn trọng và cam kết sẽ bảo mật những thông tin mang tính riêng tư
                                                của bạn. Xin vui lòng đọc bản Chính sách bảo mật dưới đây để hiểu hơn những cam
                                                kết mà chúng tôi thực hiện nhằm tôn trọng và bảo vệ quyền lợi của người truy cập.</p>
                                            <p>
                                                Chính sách bảo mật sẽ giải thích cách chúng tôi tiếp nhận, sử dụng và (trong trường
                                                hợp nào đó) tiết lộ thông tin cá nhân của bạn. Chính sách cũng sẽ giải thích các
                                                bước chúng tôi thực hiện để bảo mật thông tin cá nhân của khách hàng. Cuối cùng,
                                                Chính sách bảo mật sẽ giải thích quyền lựa chọn của quý khách về việc thu thập,
                                                sử dụng và tiết lộ thông tin cá nhân của mình.</p>
                                            <p>
                                                Bảo vệ dữ liệu cá nhân và gây dựng được niềm tin cho quý khách là vấn đề rất quan
                                                trọng với chúng tôi. Vì vậy, chúng tôi sẽ dùng tên và các thông tin khác liên quan
                                                đến quý khách tuân thủ theo nội dung của Chính sách bảo mật. Chúng tôi chỉ thu thập
                                                những thông tin cần thiết liên quan đến giao dịch mua bán.</p>
                                            <p>
                                                Chúng tôi sẽ giữ thông tin của khách hàng trong thời gian luật pháp quy định hoặc
                                                cho mục đích nào đó. Quý khách có thể truy cập vào website và trình duyệt mà không
                                                cần phải cung cấp chi tiết cá nhân. Lúc đó, bạn đang ẩn danh và chúng tôi không
                                                thể biết bạn là ai nếu bạn không đăng nhập vào tài khoản của mình.</p>
                                            <h2>
                                                1. Thu thập thông tin cá nhân</h2>
                                            <p>
                                                Chúng tôi sẽ thu thập nhiều thông tin khác nhau của quý khách khi bạn muốn đặt hàng
                                                trên web.</p>
                                            <p>
                                                Chúng tôi thu thập, lưu trữ và xử lý thông tin của bạn cho quá trình mua hàng và
                                                cho những thông báo sau này, và để cung cấp dịch vụ. Chúng tôi không giới hạn thông
                                                tin cá nhân: danh hiệu, tên, giới tính, ngày sinh, email, địa chỉ, địa chỉ giao
                                                hàng, số điện thoại, fax, chi tiết thanh toán, chi tiết thanh toán bằng thẻ hoặc
                                                chi tiết tài khoản ngân hàng.</p>
                                            <p>
                                                Chúng tôi sẽ dùng thông tin quý khách đã cung cấp để xử lý đơn đặt hàng, cung cấp
                                                các dịch vụ và thông tin yêu cầu thông qua website và theo yêu cầu của bạn. Hơn
                                                nữa, chúng tôi sẽ sử dụng các thông tin đó để quản lý tài khoản của bạn; xác minh
                                                và thực hiện giao dịch trực tuyến, kiểm toán việc tải dữ liệu từ web; cải thiện
                                                bố cục và nội dung trang web và điều chỉnh cho phù hợp với người dùng; nhận diện
                                                khách vào web, nghiên cứu nhân khẩu học, gửi thông tin bao gồm thông tin sản phẩm
                                                và dịch vụ, nếu bạn không có dấu hiệu từ chối. Nếu quý khách không muốn nhận bất
                                                cứ thông tin tiếp thị của chúng tôi thì có thể từ chối bất cứ lúc nào.</p>
                                            <p>
                                                Chúng tôi có thể chuyển tên và địa chỉ cho bên thứ ba để họ giao hàng cho bạn (ví
                                                dụ cho bên chuyển phát nhanh hoặc nhà cung cấp).</p>
                                            <p>
                                                Các khoản thanh toán trực tuyến sẽ được xử lý bởi các đại lý Mạng lưới Quốc tế của
                                                chúng tôi. Quý khách chỉ đưa cho chúng tôi hoặc Đại lý hoặc website những thông
                                                tin chính xác, không gây nhầm lẫn và phải thông báo cho chúng tôi nếu có thay đổi.</p>
                                            <p>
                                                Chi tiết đơn đặt hàng của bạn được chúng tôi lưu giữ nhưng vì lí do bảo mật nên
                                                chúng tôi không công khai trực tiếp được. Tuy nhiên, quý khách có thể tiếp cận thông
                                                tin bằng cách đăng nhập tài khoản trên web. Tại đây, bạn sẽ thấy chi tiết đơn đặt
                                                hàng của mình, những sản phẩm đã nhận và những sản phẩm đã gửi và chi tiết email,
                                                ngân hàng và bản tin mà bạn đặt theo dõi dài hạn. Quý khách cam kết bảo mật dữ liệu
                                                cá nhân và không được phép tiết lộ cho bên thứ ba. Chúng tôi không chịu bất kỳ trách
                                                nhiệm nào cho việc dùng sai mật khẩu nếu đây không phải lỗi của chúng tôi.</p>
                                            <h3>
                                                Điều lệ khác về thông tin cá nhân</h3>
                                            <p>
                                                Chúng tôi có thể dùng thông tin cá nhân của bạn để nghiên cứu thị trường. chi tiết
                                                sẽ được ẩn và chỉ được dùng để thống kê. Quý khách có thể từ chối không tham gia
                                                bất cứ lúc nào. Bất kỳ câu trả lời cho khảo sát hoặc thăm dò dư luận mà chúng tôi
                                                cần bạn làm sẽ không được chuyển cho bên thứ ba. Việc cần thiết duy nhất là tiết
                                                lộ email của bạn nếu bạn muốn tham gia. Câu trả lời sẽ được lưu tách riêng với email
                                                của bạn.</p>
                                            <p>
                                                Bạn sẽ nhận được thông tin về chúng tôi, về website, các website khác, sản phẩm,
                                                doanh số bán hàng, bản tin, bất cứ những gì liên quan đến các công ty nằm trong
                                                nhóm hoặc các đối tác kinh doanh. Nếu quý khách không muốn nhận những thông tin
                                                này, vui lòng nhấn vào link từ chối trong bất kỳ email chúng tôi gửi cho bạn. Trong
                                                vòng 7 ngày nhận chỉ dẫn của bạn, chúng tôi sẽ ngừng gửi thông tin. Nếu thấy không
                                                rõ, chúng tôi sẽ liên lạc với bạn.</p>
                                            <p>
                                                Chúng tôi sẽ tiếp tục giấu tên dữ liệu người dùng trên website và sử dụng cho nhiều
                                                mục đích khác nhau, bao gồm việc xác định vị trí của người dùng và cách sử dụng
                                                các khía cạnh nhất định của website hoặc đường link chứa trong email tới người dùng
                                                và cung cấp dữ liệu ẩn danh đó cho bên thứ 3 là nhà xuất bản. Tuy nhiên, dữ liệu
                                                này không có khả năng xác định cá nhân.</p>
                                            <h3>
                                                Cuộc thi</h3>
                                            <p>
                                                Trong bất kì cuộc thi nào, chúng tôi sẽ sử dụng dữ liệu để thông báo người chiến
                                                thắng và quảng cáo chào hàng. Bạn có thể đăng ký tham gia để biết thêm chi tiết
                                                về cuộc thi.</p>
                                            <h3>
                                                Đối tác thứ ba và Liên kết</h3>
                                            <p>
                                                Chúng tôi có thể chuyển thông tin của quý khách cho các công ty khác trong nhóm.
                                                Chúng tôi có thể chuyển thông tin của quý khách cho các đại lý và nhà thầu phụ trong
                                                khuôn khổ quy định của Chính sách bảo mật. Ví dụ: chúng tôi sẽ nhờ bên thứ ba giao
                                                hàng, nhận tiền thanh toán, phân tích dữ liệu, tiếp thị và hỗ trợ dịch vụ khách
                                                hàng. Chúng tôi có thể trao đổi thông tin với bên thứ ba với mục đích chống gian
                                                lận và giảm rủi ro tín dụng. Chúng tôi có thể chuyển cơ sở dữ liệu gồm thông tin
                                                cá nhân của bạn nếu chúng tôi bán cả công ty hoặc chỉ một phần. Trong khuôn khổ
                                                Chính sách bảo mật, chúng tôi không bán hay tiết lộ dữ liệu cá nhân của bạn cho
                                                bên thứ ba mà không được đồng ý trước trừ khi điều này là cần thiết cho các điều
                                                khoản trong Chính sách bảo mật hoặc chúng tôi được yêu cầu phải làm như vậy theo
                                                quy định của Pháp luật. Website có thể bao gồm quảng cáo của bên thứ ba và các liên
                                                kết đến các trang web khác hoặc khung của các trang web khác. Xin lưu ý rằng chúng
                                                tôi không có nhiệm vụ bảo mật thông tin hay nội dung của bên thứ ba hay các website
                                                khác, hay bất kỳ bên thứ ba nào mà chúng tôi chuyển giao dữ liệu cho phù hợp với
                                                Chính sách bảo mật.</p>
                                            <p>
                                                Hệ thống theo dõi hành vi của khách hàng được chúng tôi sử dụng trên kênh Hiển Thị
                                                Quảng Cáo (ví dụ như Tiếp Thị Lại Khách Hàng, hệ thống quản lý các chiến dịch quảng
                                                cáo DoubleClick, báo cáo về nhân khẩu, sở thích của khách hàng với công cụ Google
                                                Analytics...) có thể thu thập được các thông tin như độ tuổi, giới tính, sở thích
                                                và số lần tương tác với số lần xuất hiện của quảng cáo.</p>
                                            <p>
                                                Với tính năng cài đặt quảng cáo, người dùng hoặc khác hàng có thể lựa chọn thoát
                                                ra khỏi tính năng theo dõi hành vi khách hàng của Google Analytics và lựa chọn cách
                                                xuất hiện của kênh Hiển Thị Quảng Cáo trên Google</p>
                                            <p>
                                                MẮT KÍNH và các nhà cung cấp bên thứ ba, bao gồm Google, có thể sử dụng cookies
                                                của Google Analytics hoặc cookies của bên thứ ba (như DoubleClick) để thu thập thông
                                                tin, tối ưu hóa và phục vụ cho mục đích quảng cáo dựa trên lần truy cập website
                                                của người dùng trong quá khứ.</p>
                                            <h2>
                                                2. Sử dụng Cookie</h2>
                                            <p>
                                                Cookie là tập tin văn bản nhỏ có thể nhận dạng tên truy cập duy nhất từ máy tính
                                                của bạn đến máy chủ của chúng tôi khi bạn truy cập vào các trang nhất định trên
                                                website và sẽ được lưu bởi trình duyệt internet lên ổ cứng máy tính của bạn. Cookie
                                                được dùng để nhận dạng địa chỉ IP, lưu lại thời gian. Chúng tôi dùng cookie để tiện
                                                cho quý khách vào web (ví dụ: ghi nhớ tên truy cập khi bạn muốn vào thay đổi lại
                                                giỏ mua hàng mà không cần phải nhập lại địa chỉ email của mình) và không đòi hỏi
                                                bất kỳ thông tin nào về bạn (ví dụ: mục tiêu quảng cáo). Trình duyệt của bạn có
                                                thể được thiết lập không sử dụng cookie nhưng điều này sẽ hạn chế quyền sử dụng
                                                của bạn trên web. Xin vui lòng chấp nhận cam kết của chúng tôi là cookie không bao
                                                gồm bất cứ chi tiết cá nhân riêng tư nào và an toàn với virus. Muốn biết thêm về
                                                cookie, vui lòng truy cập <a href="webhttp://www.allaboutcookies.org">webhttp://www.allaboutcookies.org</a>
                                                hoặc để tìm hiểu cách loại bỏ cookie khỏi trình duyệt, vui lòng vào <a href="http://www.allaboutcookies.org/manage-cookies/index.html">
                                                    http://www.allaboutcookies.org/manage-cookies/index.html</a>.</p>
                                            <p>
                                                Trình duyệt này sử dụng Google Analytics, một dịch vụ phân tích web được cung cấp
                                                bởi Google, Inc. (“Google”). Google Analytics dùng cookie, là những tập tin văn
                                                bản đặt trong máy tính để giúp website phân tích người dùng vào web như thế nào.
                                                Thông tin được tổng hợp từ cookie sẽ được truyền tới và lưu bởi Google trên các
                                                máy chủ tại Hoa Kỳ. Google sẽ dùng thông tin này để đánh giá cách dùng web của bạn,
                                                lập báo cáo về các hoạt động trên web cho các nhà khai thác web và cung cấp các
                                                dịch vụ khác liên quan đến các hoạt động internet và cách dùng internet. Google
                                                cũng có thể chuyển giao thông tin này cho bên thứ ba theo yêu cầu của pháp luật
                                                hoặc các bên thứ ba xử lý thông tin trên danh nghĩa của Google. Google sẽ không
                                                kết hợp địa chỉ IP của bạn với bất kỳ dữ liệu nào khác mà Google đang giữ. Quý khách
                                                có thể từ chối dùng cookie bằng cách chọn các thiết lập thích hợp trên trình duyệt
                                                của mình, tuy nhiên lưu ý rằng điều này sẽ ngăn bạn sử dụng triệt để chức năng của
                                                website. Bằng cách sử dụng trang web này, bạn đã đồng ý cho Google xử lý dữ liệu
                                                về bạn theo cách thức và các mục đích nêu trên.</p>
                                            <h2>
                                                3. Bảo mật</h2>
                                            <p>
                                                Chúng tôi có biện pháp thích hợp về kỹ thuật và an ninh để ngăn chặn truy cập trái
                                                phép hoặc trái pháp luật hoặc mất mát hoặc tiêu hủy hoặc thiệt hại cho thông tin
                                                của bạn. Khi thu thập dữ liệu trên web, chúng tôi thu thập chi tiết cá nhân của
                                                bạn trên máy chủ an toàn. Chúng tôi dùng tường lửa cho máy chủ. Khi thu thập chi
                                                tiết các thẻ thanh toán điện tử, chúng tôi dùng mã hóa bằng Secure Socket Layer
                                                (SSL). Khi chúng tôi không thể bảo đảm an ninh 100%, SSL sẽ gây khó khăn cho hacker
                                                muốn giải mã thông tin của quý khách. Bạn không nên gửi đầy đủ chi tiết của thẻ
                                                tín dụng hay thẻ ghi nợ khi chưa được mã hóa cho chúng tôi. Chúng tôi duy trì các
                                                biện pháp bảo vệ vật lý và điện tử trong mối liên kết với thu thập, lưu trữ và tiết
                                                lộ thông tin của bạn. Các thủ tục an toàn của chúng tôi nghĩa là chúng tôi có thể
                                                đôi khi yêu cầu giấy tờ chứng minh trước khi tiết lộ thông tin cá nhân cho bạn.</p>
                                            <p>
                                                Chúng tôi khuyên quý khách rằng quý khách không nên đưa thông tin chi tiết về việc
                                                thanh toán với bất kỳ ai bằng e-mail, chúng tôi không chịu trách nhiệm về những
                                                mất mát quý khách có thể gánh chịu trong việc trao đổi thông tin của quý khách qua
                                                internet hoặc email.</p>
                                            <p>
                                                Quý khách tuyệt đối không sử dụng bất kỳ chương trình, công cụ hay hình thức nào
                                                khác để can thiệp vào hệ thống hay làm thay đổi cấu trúc dữ liệu. Nghiêm cấm việc
                                                phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại
                                                hay xâm nhập vào dữ liệu của hệ thống website. Mọi vi phạm sẽ bị tước bỏ mọi quyền
                                                lợi cũng như sẽ bị truy tố trước pháp luật nếu cần thiết.</p>
                                            <p>
                                                Mọi thông tin giao dịch sẽ được bảo mật nhưng trong trường hợp cơ quan pháp luật
                                                yêu cầu, chúng tôi sẽ buộc phải cung cấp những thông tin này cho các cơ quan pháp
                                                luật.</p>
                                            <p>
                                                Các điều kiện, điều khoản và nội dung của trang web này được điều chỉnh bởi luật
                                                pháp Việt Nam và tòa án Việt Nam có thẩm quyền xem xét.</p>
                                            <h2>
                                                4. Quyền lợi khách hàng</h2>
                                            <p>
                                                Quý khách có quyền yêu cầu truy cập vào dữ liệu cá nhân của mình, có quyền yêu cầu
                                                chúng tôi sửa lại những sai sót trong dữ liệu của bạn mà không mất phí. Bất cứ lúc
                                                nào bạn cũng có quyền yêu cầu chúng tôi ngưng sử dụng dữ liệu cá nhân của bạn cho
                                                mục đích tiếp thị.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-input">
                                    <div class="info-btn">
                                        <asp:CheckBox ID="ckbAgree1" runat="server" Text="Tôi đã đọc, hiểu và đồng ý với các điều khoản của Vietclio Aloha Fashion"
                                            CssClass="check-ok plo" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlInformationLogin" runat="server">
                            <asp:FormView ID="FormView1" DataSourceID="OdsAddressBook" DataKeyNames="AddressBookID"
                                runat="server" OnDataBound="FormView1_DataBound">
                                <ItemTemplate>
                                    <div class="form-info">
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Họ và tên</label>
                                            <div class="info-text">
                                                <asp:TextBox ID="txtFullName" CssClass="info-textbox" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="txtFullName_WatermarkExtender" runat="server" Enabled="True"
                                                    WatermarkText="-- Họ và tên --" TargetControlID="txtFullName">
                                                </asp:TextBoxWatermarkExtender>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                                    Display="Dynamic" ValidationGroup="Information" ControlToValidate="txtFullName"
                                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Điện thoại</label>
                                            <div class="info-text">
                                                <asp:TextBox ID="txtPhone" CssClass="info-textbox" runat="server" Text='<%# !string.IsNullOrEmpty(Eval("HomePhone").ToString()) ? Eval("HomePhone") : "" %>'></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                                                    WatermarkText="-- Điện thoại --" TargetControlID="txtPhone">
                                                </asp:TextBoxWatermarkExtender>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                                    Display="Dynamic" ValidationGroup="Information" ControlToValidate="txtPhone"
                                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Email</label>
                                            <div class="info-text">
                                                <asp:TextBox ID="txtEmail" CssClass="info-textbox" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="txtEmailNoRegister_WatermarkExtender" runat="server"
                                                    Enabled="True" WatermarkText="-- Email nhận thông tin khuyến mãi --" TargetControlID="txtEmail">
                                                </asp:TextBoxWatermarkExtender>
                                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                                    runat="server" ValidationGroup="Information" ControlToValidate="txtEmail" ErrorMessage="Sai định dạng email!"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                                    ForeColor="Red"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                                    ValidationGroup="Information" ControlToValidate="txtEmail" ErrorMessage="Thông tin bắt buộc!"
                                                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Địa chỉ giao hàng</label>
                                            <div class="info-text">
                                                <asp:TextBox ID="txtAddress" CssClass="info-textbox" runat="server" Text='<%# !string.IsNullOrEmpty(Eval("Address1").ToString()) ? Eval("Address1") : "" %>'></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="True"
                                                    WatermarkText="-- Địa chỉ giao hàng --" TargetControlID="txtAddress">
                                                </asp:TextBoxWatermarkExtender>
                                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                                    Display="Dynamic" ValidationGroup="Information" ControlToValidate="txtAddress"
                                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Tỉnh/ Thành phố</label>
                                            <div class="info-text">
                                                <asp:DropDownList ID="ddlProvince" AutoPostBack="true" Enabled="False" DataSourceID="OdsProvince"
                                                    DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="selectb" runat="server">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hdnProvinceID" Value='<%# Eval("ProvinceID")%>' runat="server" />
                                                <asp:ObjectDataSource ID="OdsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                                    TypeName="TLLib.Province">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="ProvinceID" Type="String" />
                                                        <asp:Parameter Name="ProvinceName" Type="String" />
                                                        <asp:Parameter Name="ShortName" Type="String" />
                                                        <asp:Parameter Name="CountryID" Type="String" />
                                                        <asp:Parameter Name="Priority" Type="String" />
                                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb">
                                                Quận/ Huyện</label>
                                            <div class="info-text">
                                                <asp:DropDownList ID="ddlDistrict" DataSourceID="OdsDistrict" DataTextField="DistrictName"
                                                    DataValueField="DistrictID" CssClass="selectb" runat="server">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hdnDistrictID" Value='<%# Eval("DistrictID")%>' runat="server" />
                                                <asp:ObjectDataSource ID="OdsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                                    TypeName="TLLib.District">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="DistrictName" Type="String" />
                                                        <asp:SessionParameter Name="ProvinceIDs" SessionField="ProvinceID" Type="String" />
                                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                        <asp:Parameter Name="Priority" Type="String" />
                                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb info-l16">
                                                Ghi chú</label>
                                            <div class="info-text">
                                                <asp:TextBox ID="txtMessage" CssClass="info-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <label class="info-lb info-l16">
                                                Điều khoàn mua hàng</label>
                                            <div class="info-text">
                                                <div class="description">
                                                    <p>
                                                        Cám ơn quý khách đã truy cập vào website MẮT KÍNH.VN được vận hành bởi SUSTAINABILITY
                                                        CO. Chúng tôi tôn trọng và cam kết sẽ bảo mật những thông tin mang tính riêng tư
                                                        của bạn. Xin vui lòng đọc bản Chính sách bảo mật dưới đây để hiểu hơn những cam
                                                        kết mà chúng tôi thực hiện nhằm tôn trọng và bảo vệ quyền lợi của người truy cập.</p>
                                                    <p>
                                                        Chính sách bảo mật sẽ giải thích cách chúng tôi tiếp nhận, sử dụng và (trong trường
                                                        hợp nào đó) tiết lộ thông tin cá nhân của bạn. Chính sách cũng sẽ giải thích các
                                                        bước chúng tôi thực hiện để bảo mật thông tin cá nhân của khách hàng. Cuối cùng,
                                                        Chính sách bảo mật sẽ giải thích quyền lựa chọn của quý khách về việc thu thập,
                                                        sử dụng và tiết lộ thông tin cá nhân của mình.</p>
                                                    <p>
                                                        Bảo vệ dữ liệu cá nhân và gây dựng được niềm tin cho quý khách là vấn đề rất quan
                                                        trọng với chúng tôi. Vì vậy, chúng tôi sẽ dùng tên và các thông tin khác liên quan
                                                        đến quý khách tuân thủ theo nội dung của Chính sách bảo mật. Chúng tôi chỉ thu thập
                                                        những thông tin cần thiết liên quan đến giao dịch mua bán.</p>
                                                    <p>
                                                        Chúng tôi sẽ giữ thông tin của khách hàng trong thời gian luật pháp quy định hoặc
                                                        cho mục đích nào đó. Quý khách có thể truy cập vào website và trình duyệt mà không
                                                        cần phải cung cấp chi tiết cá nhân. Lúc đó, bạn đang ẩn danh và chúng tôi không
                                                        thể biết bạn là ai nếu bạn không đăng nhập vào tài khoản của mình.</p>
                                                    <h2>
                                                        1. Thu thập thông tin cá nhân</h2>
                                                    <p>
                                                        Chúng tôi sẽ thu thập nhiều thông tin khác nhau của quý khách khi bạn muốn đặt hàng
                                                        trên web.</p>
                                                    <p>
                                                        Chúng tôi thu thập, lưu trữ và xử lý thông tin của bạn cho quá trình mua hàng và
                                                        cho những thông báo sau này, và để cung cấp dịch vụ. Chúng tôi không giới hạn thông
                                                        tin cá nhân: danh hiệu, tên, giới tính, ngày sinh, email, địa chỉ, địa chỉ giao
                                                        hàng, số điện thoại, fax, chi tiết thanh toán, chi tiết thanh toán bằng thẻ hoặc
                                                        chi tiết tài khoản ngân hàng.</p>
                                                    <p>
                                                        Chúng tôi sẽ dùng thông tin quý khách đã cung cấp để xử lý đơn đặt hàng, cung cấp
                                                        các dịch vụ và thông tin yêu cầu thông qua website và theo yêu cầu của bạn. Hơn
                                                        nữa, chúng tôi sẽ sử dụng các thông tin đó để quản lý tài khoản của bạn; xác minh
                                                        và thực hiện giao dịch trực tuyến, kiểm toán việc tải dữ liệu từ web; cải thiện
                                                        bố cục và nội dung trang web và điều chỉnh cho phù hợp với người dùng; nhận diện
                                                        khách vào web, nghiên cứu nhân khẩu học, gửi thông tin bao gồm thông tin sản phẩm
                                                        và dịch vụ, nếu bạn không có dấu hiệu từ chối. Nếu quý khách không muốn nhận bất
                                                        cứ thông tin tiếp thị của chúng tôi thì có thể từ chối bất cứ lúc nào.</p>
                                                    <p>
                                                        Chúng tôi có thể chuyển tên và địa chỉ cho bên thứ ba để họ giao hàng cho bạn (ví
                                                        dụ cho bên chuyển phát nhanh hoặc nhà cung cấp).</p>
                                                    <p>
                                                        Các khoản thanh toán trực tuyến sẽ được xử lý bởi các đại lý Mạng lưới Quốc tế của
                                                        chúng tôi. Quý khách chỉ đưa cho chúng tôi hoặc Đại lý hoặc website những thông
                                                        tin chính xác, không gây nhầm lẫn và phải thông báo cho chúng tôi nếu có thay đổi.</p>
                                                    <p>
                                                        Chi tiết đơn đặt hàng của bạn được chúng tôi lưu giữ nhưng vì lí do bảo mật nên
                                                        chúng tôi không công khai trực tiếp được. Tuy nhiên, quý khách có thể tiếp cận thông
                                                        tin bằng cách đăng nhập tài khoản trên web. Tại đây, bạn sẽ thấy chi tiết đơn đặt
                                                        hàng của mình, những sản phẩm đã nhận và những sản phẩm đã gửi và chi tiết email,
                                                        ngân hàng và bản tin mà bạn đặt theo dõi dài hạn. Quý khách cam kết bảo mật dữ liệu
                                                        cá nhân và không được phép tiết lộ cho bên thứ ba. Chúng tôi không chịu bất kỳ trách
                                                        nhiệm nào cho việc dùng sai mật khẩu nếu đây không phải lỗi của chúng tôi.</p>
                                                    <h3>
                                                        Điều lệ khác về thông tin cá nhân</h3>
                                                    <p>
                                                        Chúng tôi có thể dùng thông tin cá nhân của bạn để nghiên cứu thị trường. chi tiết
                                                        sẽ được ẩn và chỉ được dùng để thống kê. Quý khách có thể từ chối không tham gia
                                                        bất cứ lúc nào. Bất kỳ câu trả lời cho khảo sát hoặc thăm dò dư luận mà chúng tôi
                                                        cần bạn làm sẽ không được chuyển cho bên thứ ba. Việc cần thiết duy nhất là tiết
                                                        lộ email của bạn nếu bạn muốn tham gia. Câu trả lời sẽ được lưu tách riêng với email
                                                        của bạn.</p>
                                                    <p>
                                                        Bạn sẽ nhận được thông tin về chúng tôi, về website, các website khác, sản phẩm,
                                                        doanh số bán hàng, bản tin, bất cứ những gì liên quan đến các công ty nằm trong
                                                        nhóm hoặc các đối tác kinh doanh. Nếu quý khách không muốn nhận những thông tin
                                                        này, vui lòng nhấn vào link từ chối trong bất kỳ email chúng tôi gửi cho bạn. Trong
                                                        vòng 7 ngày nhận chỉ dẫn của bạn, chúng tôi sẽ ngừng gửi thông tin. Nếu thấy không
                                                        rõ, chúng tôi sẽ liên lạc với bạn.</p>
                                                    <p>
                                                        Chúng tôi sẽ tiếp tục giấu tên dữ liệu người dùng trên website và sử dụng cho nhiều
                                                        mục đích khác nhau, bao gồm việc xác định vị trí của người dùng và cách sử dụng
                                                        các khía cạnh nhất định của website hoặc đường link chứa trong email tới người dùng
                                                        và cung cấp dữ liệu ẩn danh đó cho bên thứ 3 là nhà xuất bản. Tuy nhiên, dữ liệu
                                                        này không có khả năng xác định cá nhân.</p>
                                                    <h3>
                                                        Cuộc thi</h3>
                                                    <p>
                                                        Trong bất kì cuộc thi nào, chúng tôi sẽ sử dụng dữ liệu để thông báo người chiến
                                                        thắng và quảng cáo chào hàng. Bạn có thể đăng ký tham gia để biết thêm chi tiết
                                                        về cuộc thi.</p>
                                                    <h3>
                                                        Đối tác thứ ba và Liên kết</h3>
                                                    <p>
                                                        Chúng tôi có thể chuyển thông tin của quý khách cho các công ty khác trong nhóm.
                                                        Chúng tôi có thể chuyển thông tin của quý khách cho các đại lý và nhà thầu phụ trong
                                                        khuôn khổ quy định của Chính sách bảo mật. Ví dụ: chúng tôi sẽ nhờ bên thứ ba giao
                                                        hàng, nhận tiền thanh toán, phân tích dữ liệu, tiếp thị và hỗ trợ dịch vụ khách
                                                        hàng. Chúng tôi có thể trao đổi thông tin với bên thứ ba với mục đích chống gian
                                                        lận và giảm rủi ro tín dụng. Chúng tôi có thể chuyển cơ sở dữ liệu gồm thông tin
                                                        cá nhân của bạn nếu chúng tôi bán cả công ty hoặc chỉ một phần. Trong khuôn khổ
                                                        Chính sách bảo mật, chúng tôi không bán hay tiết lộ dữ liệu cá nhân của bạn cho
                                                        bên thứ ba mà không được đồng ý trước trừ khi điều này là cần thiết cho các điều
                                                        khoản trong Chính sách bảo mật hoặc chúng tôi được yêu cầu phải làm như vậy theo
                                                        quy định của Pháp luật. Website có thể bao gồm quảng cáo của bên thứ ba và các liên
                                                        kết đến các trang web khác hoặc khung của các trang web khác. Xin lưu ý rằng chúng
                                                        tôi không có nhiệm vụ bảo mật thông tin hay nội dung của bên thứ ba hay các website
                                                        khác, hay bất kỳ bên thứ ba nào mà chúng tôi chuyển giao dữ liệu cho phù hợp với
                                                        Chính sách bảo mật.</p>
                                                    <p>
                                                        Hệ thống theo dõi hành vi của khách hàng được chúng tôi sử dụng trên kênh Hiển Thị
                                                        Quảng Cáo (ví dụ như Tiếp Thị Lại Khách Hàng, hệ thống quản lý các chiến dịch quảng
                                                        cáo DoubleClick, báo cáo về nhân khẩu, sở thích của khách hàng với công cụ Google
                                                        Analytics...) có thể thu thập được các thông tin như độ tuổi, giới tính, sở thích
                                                        và số lần tương tác với số lần xuất hiện của quảng cáo.</p>
                                                    <p>
                                                        Với tính năng cài đặt quảng cáo, người dùng hoặc khác hàng có thể lựa chọn thoát
                                                        ra khỏi tính năng theo dõi hành vi khách hàng của Google Analytics và lựa chọn cách
                                                        xuất hiện của kênh Hiển Thị Quảng Cáo trên Google</p>
                                                    <p>
                                                        MẮT KÍNH và các nhà cung cấp bên thứ ba, bao gồm Google, có thể sử dụng cookies
                                                        của Google Analytics hoặc cookies của bên thứ ba (như DoubleClick) để thu thập thông
                                                        tin, tối ưu hóa và phục vụ cho mục đích quảng cáo dựa trên lần truy cập website
                                                        của người dùng trong quá khứ.</p>
                                                    <h2>
                                                        2. Sử dụng Cookie</h2>
                                                    <p>
                                                        Cookie là tập tin văn bản nhỏ có thể nhận dạng tên truy cập duy nhất từ máy tính
                                                        của bạn đến máy chủ của chúng tôi khi bạn truy cập vào các trang nhất định trên
                                                        website và sẽ được lưu bởi trình duyệt internet lên ổ cứng máy tính của bạn. Cookie
                                                        được dùng để nhận dạng địa chỉ IP, lưu lại thời gian. Chúng tôi dùng cookie để tiện
                                                        cho quý khách vào web (ví dụ: ghi nhớ tên truy cập khi bạn muốn vào thay đổi lại
                                                        giỏ mua hàng mà không cần phải nhập lại địa chỉ email của mình) và không đòi hỏi
                                                        bất kỳ thông tin nào về bạn (ví dụ: mục tiêu quảng cáo). Trình duyệt của bạn có
                                                        thể được thiết lập không sử dụng cookie nhưng điều này sẽ hạn chế quyền sử dụng
                                                        của bạn trên web. Xin vui lòng chấp nhận cam kết của chúng tôi là cookie không bao
                                                        gồm bất cứ chi tiết cá nhân riêng tư nào và an toàn với virus. Muốn biết thêm về
                                                        cookie, vui lòng truy cập <a href="webhttp://www.allaboutcookies.org">webhttp://www.allaboutcookies.org</a>
                                                        hoặc để tìm hiểu cách loại bỏ cookie khỏi trình duyệt, vui lòng vào <a href="http://www.allaboutcookies.org/manage-cookies/index.html">
                                                            http://www.allaboutcookies.org/manage-cookies/index.html</a>.</p>
                                                    <p>
                                                        Trình duyệt này sử dụng Google Analytics, một dịch vụ phân tích web được cung cấp
                                                        bởi Google, Inc. (“Google”). Google Analytics dùng cookie, là những tập tin văn
                                                        bản đặt trong máy tính để giúp website phân tích người dùng vào web như thế nào.
                                                        Thông tin được tổng hợp từ cookie sẽ được truyền tới và lưu bởi Google trên các
                                                        máy chủ tại Hoa Kỳ. Google sẽ dùng thông tin này để đánh giá cách dùng web của bạn,
                                                        lập báo cáo về các hoạt động trên web cho các nhà khai thác web và cung cấp các
                                                        dịch vụ khác liên quan đến các hoạt động internet và cách dùng internet. Google
                                                        cũng có thể chuyển giao thông tin này cho bên thứ ba theo yêu cầu của pháp luật
                                                        hoặc các bên thứ ba xử lý thông tin trên danh nghĩa của Google. Google sẽ không
                                                        kết hợp địa chỉ IP của bạn với bất kỳ dữ liệu nào khác mà Google đang giữ. Quý khách
                                                        có thể từ chối dùng cookie bằng cách chọn các thiết lập thích hợp trên trình duyệt
                                                        của mình, tuy nhiên lưu ý rằng điều này sẽ ngăn bạn sử dụng triệt để chức năng của
                                                        website. Bằng cách sử dụng trang web này, bạn đã đồng ý cho Google xử lý dữ liệu
                                                        về bạn theo cách thức và các mục đích nêu trên.</p>
                                                    <h2>
                                                        3. Bảo mật</h2>
                                                    <p>
                                                        Chúng tôi có biện pháp thích hợp về kỹ thuật và an ninh để ngăn chặn truy cập trái
                                                        phép hoặc trái pháp luật hoặc mất mát hoặc tiêu hủy hoặc thiệt hại cho thông tin
                                                        của bạn. Khi thu thập dữ liệu trên web, chúng tôi thu thập chi tiết cá nhân của
                                                        bạn trên máy chủ an toàn. Chúng tôi dùng tường lửa cho máy chủ. Khi thu thập chi
                                                        tiết các thẻ thanh toán điện tử, chúng tôi dùng mã hóa bằng Secure Socket Layer
                                                        (SSL). Khi chúng tôi không thể bảo đảm an ninh 100%, SSL sẽ gây khó khăn cho hacker
                                                        muốn giải mã thông tin của quý khách. Bạn không nên gửi đầy đủ chi tiết của thẻ
                                                        tín dụng hay thẻ ghi nợ khi chưa được mã hóa cho chúng tôi. Chúng tôi duy trì các
                                                        biện pháp bảo vệ vật lý và điện tử trong mối liên kết với thu thập, lưu trữ và tiết
                                                        lộ thông tin của bạn. Các thủ tục an toàn của chúng tôi nghĩa là chúng tôi có thể
                                                        đôi khi yêu cầu giấy tờ chứng minh trước khi tiết lộ thông tin cá nhân cho bạn.</p>
                                                    <p>
                                                        Chúng tôi khuyên quý khách rằng quý khách không nên đưa thông tin chi tiết về việc
                                                        thanh toán với bất kỳ ai bằng e-mail, chúng tôi không chịu trách nhiệm về những
                                                        mất mát quý khách có thể gánh chịu trong việc trao đổi thông tin của quý khách qua
                                                        internet hoặc email.</p>
                                                    <p>
                                                        Quý khách tuyệt đối không sử dụng bất kỳ chương trình, công cụ hay hình thức nào
                                                        khác để can thiệp vào hệ thống hay làm thay đổi cấu trúc dữ liệu. Nghiêm cấm việc
                                                        phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại
                                                        hay xâm nhập vào dữ liệu của hệ thống website. Mọi vi phạm sẽ bị tước bỏ mọi quyền
                                                        lợi cũng như sẽ bị truy tố trước pháp luật nếu cần thiết.</p>
                                                    <p>
                                                        Mọi thông tin giao dịch sẽ được bảo mật nhưng trong trường hợp cơ quan pháp luật
                                                        yêu cầu, chúng tôi sẽ buộc phải cung cấp những thông tin này cho các cơ quan pháp
                                                        luật.</p>
                                                    <p>
                                                        Các điều kiện, điều khoản và nội dung của trang web này được điều chỉnh bởi luật
                                                        pháp Việt Nam và tòa án Việt Nam có thẩm quyền xem xét.</p>
                                                    <h2>
                                                        4. Quyền lợi khách hàng</h2>
                                                    <p>
                                                        Quý khách có quyền yêu cầu truy cập vào dữ liệu cá nhân của mình, có quyền yêu cầu
                                                        chúng tôi sửa lại những sai sót trong dữ liệu của bạn mà không mất phí. Bất cứ lúc
                                                        nào bạn cũng có quyền yêu cầu chúng tôi ngưng sử dụng dữ liệu cá nhân của bạn cho
                                                        mục đích tiếp thị.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="info-input">
                                            <div class="info-btn">
                                                <asp:CheckBox ID="ckbAgree" runat="server" Text="Tôi đã đọc, hiểu và đồng ý với các điều khoản của Vietclio Aloha Fashion"
                                                    CssClass="check-ok plo" />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="OdsAddressBook" runat="server" SelectMethod="AddressBookSelectAll"
                                TypeName="TLLib.AddressBook">
                                <SelectParameters>
                                    <asp:Parameter Name="AddressBookID" Type="String" />
                                    <asp:Parameter Name="FirstName" Type="String" />
                                    <asp:Parameter Name="LastName" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="HomePhone" Type="String" />
                                    <asp:Parameter Name="CellPhone" Type="String" />
                                    <asp:Parameter Name="Fax" Type="String" />
                                    <%--<asp:SessionParameter Name="UserName" SessionField="UserName" DefaultValue="-1" Type="String" />--%>
                                    <asp:Parameter Name="UserName" Type="String" />
                                    <asp:Parameter Name="Company" Type="String" />
                                    <asp:Parameter Name="Address1" Type="String" />
                                    <asp:Parameter Name="Address2" Type="String" />
                                    <asp:Parameter Name="ZipCode" Type="String" />
                                    <asp:Parameter Name="City" Type="String" />
                                    <asp:Parameter Name="CountryID" Type="String" />
                                    <asp:Parameter Name="ProvinceID" Type="String" />
                                    <asp:Parameter Name="DistrictID" Type="String" />
                                    <asp:Parameter Name="IsPrimary" Type="String" />
                                    <asp:Parameter Name="IsPrimaryBilling" Type="String" />
                                    <asp:Parameter Name="IsPrimaryShipping" Type="String" />
                                    <asp:Parameter Name="RoleName" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </asp:Panel>
                    </div>
                    <div class="addres-info box-right">
                        <h2 class="tit-tb">
                            Hình thức thanh toán</h2>
                        <div class="form-info">
                            <p class="fsi">
                                Aliquam dapibus tincidunt metus praesent justo dolor, lobortis quis, lobortis dignissim
                                ulvinar ac lorem</p>
                            <%--<asp:RadioButtonList ID="rbtMoneyShow" CssClass="list-cart" runat="server">
                                <asp:ListItem><img src="assets/images/icon-c-1.png" alt="" /><span>Thanh toán trực tiếp khi nhận hàng</span></asp:ListItem>
                                <asp:ListItem><img src="assets/images/icon-c-2.png" alt="" /><span>Thẻ ATM nội địa qua OnePay</span></asp:ListItem>
                                <asp:ListItem><img src="assets/images/icon-c-3.png" alt="" /><span>Thẻ VISA, MASTER qua OnePAY</span></asp:ListItem>
                                <asp:ListItem><img src="assets/images/icon-c-4.png" alt="" /><span>Thanh toán bằng chuyển khoản trực tiếp.<br />
                                        Chi nhánh: Ngân hàng Đông Á - chi nhánh Quận 1<br />
                                        Số tài khoản: 0909xxxxxx<br />
                                        Tên: Nguyễn Văn A
                                    </span>
                                </asp:ListItem>
                            </asp:RadioButtonList>--%>
                            <ul class="list-cart">
                                <li id="rbtMoneyShow" runat="server">
                                    <asp:RadioButton ID="rbtMoney" runat="server" CssClass="payment paywith-money" GroupName="checkradio" />
                                    <label for="RadioButton1">
                                        <img src="assets/images/icon-c-1.png" alt="" />Tiền mặt</label>
                                </li>
                                <li>
                                    <asp:RadioButton ID="rbtOnePayNoiDia" runat="server" CssClass="payment paywith-onepaynd"
                                        GroupName="checkradio" />
                                    <label for="RadioButton2">
                                        <img src="assets/images/icon-c-2.png" alt="" />Thẻ ATM nội địa qua OnePAY</label>
                                </li>
                                <li>
                                    <asp:RadioButton ID="rbtOnePayQuocTe" runat="server" CssClass="payment paywith-onepayqt"
                                        GroupName="checkradio" />
                                    <label for="RadioButton3">
                                        <img src="assets/images/icon-c-3.png" alt="" />Thẻ VISA, MASTER qua OnePAY</label>
                                </li>
                                <li>
                                    <asp:RadioButton ID="rbtEmail" runat="server" CssClass="payment paywith-email" GroupName="checkradio" />
                                    <label for="RadioButton4">
                                        <img src="assets/images/icon-c-4.png" alt="" />Thanh toán bằng chuyển khoản trực
                                        tiếp.
                                        <div class="sendemailtext" style="display: none; line-height: 18px;">
                                            <br />
                                            &nbsp;&nbsp;&nbsp; &bull; Chi nhánh: <strong>Ngân hàng Đông Á - chi nhánh Đinh Tiên
                                                Hoàng</strong><br />
                                            &nbsp;&nbsp;&nbsp; &bull; Số tài khoản: <strong>011 231 830 001</strong>
                                            <br />
                                            &nbsp;&nbsp;&nbsp; &bull; Tên: <strong>Công ty TNHH Tư Vấn Giải Pháp Bền Vững</strong>
                                        </div>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <h2 class="tit-tb top-line">
                            Thông tin đơn hàng</h2>
                        <div class="form-info">
                            <p class="fsi">
                                Bạn có
                                <asp:Label ID="lblCountProduct" runat="server" Text="0"></asp:Label>
                                sản phẩm trong giỏ hàng</p>
                            <div class="table-responsive">
                                <asp:ListView ID="lstShoppingCart" runat="server" DataSourceID="odsCart" EnableModelValidation="True"
                                    OnDataBound="lstShoppingCart_DataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <strong>
                                                    <%# Eval("ProductName") + "<br/>" + Eval("Tag")%>
                                                </strong>
                                            </td>
                                            <td>
                                                <%# Eval("Quantity") %>
                                            </td>
                                            <td>
                                                <%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : (string.Format("{0:##,###.##}", Convert.ToInt16(string.IsNullOrEmpty(Eval("Quantity").ToString()) ? 0 : Eval("Quantity")) * Convert.ToDouble(string.IsNullOrEmpty(Eval("Price").ToString()) ? 0 : Eval("Price"))).Replace('.', '*').Replace(',', '.').Replace('*', ','))%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table class="cart-tb table" cellpadding="0" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="col-1">
                                                        Tên sản phẩm
                                                    </th>
                                                    <th class="col-2">
                                                        số lượng
                                                    </th>
                                                    <th class="col-3">
                                                        Giá (VNĐ)
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="f-line">
                                                        <span>Thành tiền</span><strong><asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label>
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <span>Phí ship</span> <strong>
                                                            <asp:Label ID="lblShippingPrice" runat="server" Text="Label"></asp:Label>
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <span>Tổng cộng</span> <strong>
                                                            <asp:Label ID="lblSumTotalPrice" runat="server" Text="Label"></asp:Label>
                                                            <asp:HiddenField ID="hdnSumTotalPrice" runat="server" />
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <span runat="server" id="itemPlaceholder" />
                                            </tbody>
                                        </table>
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart">
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <div class="box-register text-center">
                        <div class="btn-register">
                            <a class="btn-a" href="gio-hang.aspx">quay lại giỏ hàng</a>
                            <asp:Button ID="btnOrder" runat="server" ValidationGroup="Information" OnClientClick="return CheckPayment()"
                                CssClass="btn-a" Text="Hoàn thành đơn đặt hàng" OnClick="btnOrder_Click" />
                            <asp:Button ID="btnOrderLogin" runat="server" ValidationGroup="InformationLogin"
                                OnClientClick="return CheckPayment()" CssClass="btn-a" Text="Hoàn thành đơn đặt hàng"
                                OnClick="btnOrderLogin_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
</asp:Content>
