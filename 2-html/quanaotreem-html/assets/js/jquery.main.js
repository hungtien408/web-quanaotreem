function pageLoad() {
}
(function ($) {
    $(window).load(function () {
    });
    $(function () {
        myfunload();
        mypageload();
    });
    /*=============================fun=========================================*/
    function myfunload() {
        $(".panel-a").mobilepanel();

        $('#footeriso').isotope({
            itemSelector: '.element-item',
            layoutMode: 'fitRows'
        });
        if ($('#slider').size() == 1) {
            var $banner = $('#slider').imagesLoaded(function () {
                $banner.nivoSlider({
                    pauseOnHover: false,
                    directionNav: false,
                    controlNav: false
                });
            });
        }
        $(".wrapper-tabs").tabsRepon({
            tabstype: false
        });
        $(".fullbox-img").bgsizebox({
            fimg: true,
            imgcss: "hideo",
            attrname: "data-src"
        });

        $(".search-link").click(function () {
            var idp = $(this).attr("href");
            $(this).toggleClass("open");
            if ($(this).hasClass("open")) {
                $(idp).fadeIn(500);
            } else {
                $(idp).fadeOut(500);
            }
            return false;
        });
        if ($('#sliderList').size() == 1) {
            $('#sliderList ul').clone().appendTo($("#jcarouselPro .jcarousel"));
            var numv = 3;
            var numli = $('#sliderList li').size();
            var nummin = 0;
            if (numli > numv) {
                nummin = numv;
            } else {
                nummin = numli;
            }
            //var maxHeight = Math.max.apply(null, $(".slide", $('#sliderList')).map(function () {
            //    return $(this).height();
            //}).get());
            var sliderpro = $('#sliderList ul').bxSlider({
                auto: true,
                autoHover: true,
                pager: false,
                mode: 'vertical',
                nextSelector: '#slider-next',
                prevSelector: '#slider-prev',
                minSlides: nummin,
                slideMargin: 10
            });
            $('#sliderList .btn-slider').click(function () {
                sliderpro.startAuto();
            });
            $("#jcarouselPro").jcarouselbox({
                autos: true,
                pausehover: true,
                pager: false, //pager num
                wipont: [{ widthpoint: "600", numcount: "3" }, { widthpoint: "360", numcount: "2" }],
                timespees: 3000,
                wrapsroll: true
            }).textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-name" }],
                wpointb: true,
                widthpont: 359,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                max: true
            });
        }
        //if ($("#jcarouselDetails").size() == 1) {
        //    $("#jcarouselDetails").jcarouselzoom({
        //        autos: false,
        //        pausehover: false,
        //        pager: false, //pager num
        //        timespees: 3000,
        //        thumswrap: false, // thums sroll
        //        shownum: 4, // show number thums
        //        usezoom: true
        //    });
        //}
        if ($("#supprortAside").size() == 1 && $("#supportMobile").size() == 1) {
            $("#supprortAside .box-sup").each(function (e) {
                $("#supportMobile").append('<div class="col-md-3 col-xs-4 element-item"></div>');
                $(this).clone().appendTo($("#supportMobile .element-item:eq(" + e + ')'));
            });
        }
        if ($(".tb-last").size() > 0) {
            $(".tb-last").each(function () {
                var nummax = $(this).attr("data-num");
                var numsize = $(this).find(".element-item").size();
                if (numsize > nummax) {
                    var modnum = numsize % nummax;
                    if (modnum == 1) {
                        $(this).find(".element-item:last").addClass("last");
                    } else if (modnum == 2) {
                        $(this).find(".element-item:last").addClass("last").prev().addClass("last");
                    }
                }
            });
        }
        colorlink();

        if ($(".list-video").size() > 0) {
            $(".list-video").jcarouselbox({
                autos: false,
                pausehover: false,
                pager: false, //pager num
                wipont: [{ widthpoint: "940", numcount: "4" }, { widthpoint: "620", numcount: "3" }, { widthpoint: "319", numcount: "2" }],
                timespees: 3000,
                wrapsroll: true
            }).textHeight({
                activetit: true,
                listcss: [{ cssname: ".pro-name" }],
                wpointb: true,
                widthpont: 319,
                desbool: true,
                listpos: [{ cssnamepos: ".desciption", cssheightnum: "3" }],
                max: true
            });
            $("#popupvideo").stop(true, true).animate({ "opacity": 0 }, 0);
            $(".list-video .video-img").click(function () {
                $(".video-img").removeClass("current");
                $(this).addClass("current");

                var videosrc = $(this).attr("data-video");
                jwplayer('jwplayer').setup({
                    file: videosrc,
                    flashplayer: "assets/js/jwplayer.flash.swf",
                    width: '100%',
                    aspectratio: '16:9'
                });
                jwplayer('jwplayer').play();
                //var cleartimes;
                //var linksrc = $(this).attr("data-link");
                //$("#popupvideo .modal-content").load(linksrc + " #playvideo");
                $('#popupvideo').on('show.bs.modal', function (e) {
                    $("#popupvideo").stop(true, true).animate({ "opacity": 1 }, 500);
                });
                $('#popupvideo').on('hide.bs.modal', function (e) {
                    $(".video-img").removeClass("current");
                    $("#popupvideo").stop(true, true).animate({ "opacity": 0 }, 0);
                    jwplayer('jwplayer').play();
                });
            });
        }

        myfunsroll();
        if ($("#result").size() == 1) {
            mymapfun();
        }
        $(".btn-register .link-show").click(function () {
            $(this).toggleClass("current");
            var idregister = $(this).attr("href");
            if ($(this).hasClass("current")) {
                $(idregister).stop(true, true).slideDown();
            } else {
                $(idregister).stop(true, true).slideUp();
            }
            return false;
        });
    }
    /*=========================================================================*/
    function mypageload() {
        $(".menu-check input").uniform();
        $(".selectb").uniform();
        $('#mainContent').imagesLoaded(function () {
            myListTb();
        });
    }
    /*========================================================================*/
    function myListTb() {
        if ($('#isotopelist').size() == 1) {
            $('#isotopelist').isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        }
        if ($('.product-tb').size() > 0) {
            $('.product-tb').textHeight({
                activetit: true,
                listcss: [{ cssname: ".boximg-in" }, { cssname: ".product-name" }, { cssname: ".pro-code" }],
                wpointb: true,
                //widthpont: 479,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            }).isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        }
        if ($('.support-tb').size() > 0) {
            $('.support-tb').textHeight({
                activetit: true,
                listcss: [{ cssname: ".sup-img" }, { cssname: ".sup-name" }],
                wpointb: true,
                //widthpont: 479,
                desbool: true,
                listpos: [{ cssnamepos: ".desciption", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            }).isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        }
        if ($('.tb-video').size() > 0) {
            $('.tb-video').textHeight({
                activetit: true,
                listcss: [{ cssname: ".video-img" }, { cssname: ".video-name" }],
                wpointb: true,
                //widthpont: 479,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            }).isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        }
    }
    /*===============================*/
    function myfunsroll() {
        menusroll();
        mysroll();
        $("#sroltop a").click(function () {
            $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
            return false;
        });
    }
    function mysroll() {
        mysrol($(window).scrollTop());
        $(window).scroll(function () {
            mysrol($(this).scrollTop());
        });
    }
    function mysrol(topsroll) {
        //var topsroll = $(window).scrollTop();
        if (topsroll > 100) {
            $("#sroltop").stop(true, true).animate({ "opacity": 0.8 }, 500);
        } else {
            $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
        }
    }
    function menusroll() {
        var htop = $("#header").height();
        srollmenu(htop);
        $(window).scroll(function () {
            srollmenu(htop);
        });
    }
    function srollmenu(htop) {
        if ($(window).scrollTop() > htop) {
            $("#header").addClass("header-sroll");
        } else {
            $("#header").removeClass("header-sroll");
        }
    }
    /*===========================================================*/
    function colorlink() {
        var urlfirt = $("#colorN .link-color:first").attr("href");
        $("#colorN .link-color:first").addClass("current");
        mycolor(urlfirt);
        $("#colorN .link-color").click(function () {
            $("#colorN .link-color").removeClass('current');
            $(this).addClass("current");
            var urllink = $(this).attr("href");
            mycolor(urllink);
            return false;
        });
    }
    function mycolor(urlk) {
        var myclearu;
        clearTimeout(myclearu);
        $("#detais-image").load(urlk + " #jcarouselDetails", function (response, status, xhr) {
            if (status == "success") {
                $("#jcarouselDetails").jcarouselzoom({
                    autos: false,
                    pausehover: false,
                    pager: false, //pager num
                    timespees: 3000,
                    thumswrap: false, // thums sroll
                    shownum: 4, // show number thums
                    usezoom: true
                });
                $("#jcarouselDetails").stop(true, true).animate({ "opacity": 0 }, 0);
                myclearu = setTimeout(function () {
                    $("#jcarouselDetails").stop(true, true).animate({ "opacity": 1 }, 500);
                }, 300);

            }
            if (status == "error") {
                var msg = "Sorry but there was an error: ";
                $("#error").html(msg + xhr.status + " " + xhr.statusText);
            }
        });
    }

    /*==================*/
    function mymapfun() {
        mymapload();
        var myclearmap;
        clearTimeout(myclearmap);
        $(window).resize(function () {
            $("#mapwrap").remove();
            myclearmap = setTimeout(function () {
                mymapload();
            }, 500);
        });
    }
    function mymapload() {
        if ($(window).width() > 767) {
            $("#result").load("map.aspx #mapwrap", function (response, status, xhr) {
                if (status == "success") {
                    mymap();
                }
                if (status == "error") {
                    var msg = "Sorry but there was an error: ";
                    $("#error").html(msg + xhr.status + " " + xhr.statusText);
                }
            });
        }
    }
    function mymap() {

        // Defining variables that need to be available to some functions
        var map, infoWindow;
        var rendererOptions = {
            draggable: true
        };
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        //Thay dia chi web
        var endAddress = "10.755542, 106.653918";
        //Thay toa do
        var lat = 10.755542, long = 106.653918;
        mufunmap();
        $("#getdiretion").click(function () {
            calcRoute();
            return false;
        });
        //function
        function mufunmap() {
            //init direction
            directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
            // Creating a map
            var options = {
                zoom: 17,
                center: new google.maps.LatLng(lat, long),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById('map'), options);


            // Adding a marker
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(lat, long),
                map: map,
                title: 'Click me'
            });
            // Adding a marker


            google.maps.event.addListener(marker, 'click', function () {

                // Check to see if an InfoWindow already exists
                if (!infoWindow) {
                    infoWindow = new google.maps.InfoWindow();
                }

                // Creating the content  
                var content = '<div class="box">' +
                    '<h2>little angles</h2>' +
                    '<div class="wrap-mapbox">' +
                        '<p>Địa chỉ: 673 Lê Hồng Phong, Phường 10, Quận 10, TPHCM</p>' +
                        '<p>Tel: 0908 563 644 (Mr.Hiền) - 0902 717 575 (Ms. Điêp )</p>' +
                        '<p>Facebook: <a href="http://www.facebook.com/shopnguyenhien" target="_blank">www.facebook.com/shopnguyenhien</a>' +
                        '<p>Web: <a href="http://www.nguyenhienshop.com">www.nguyenhienshop.com</a></p>' +
                    '</div>' +
                '</div>';

                // Setting the content of the InfoWindow
                infoWindow.setContent(content);

                // Opening the InfoWindow
                infoWindow.open(map, marker);

            });

            // Hiển thị thông tin
            google.maps.event.trigger(marker, 'click');

            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById("directionsPanel"));
        };
        function calcRoute() {
            var start = document.getElementById("start").value;
            var end = endAddress;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.WALKING
                //travelMode: google.maps.DirectionsTravelMode.BICYCLING
                //travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }
    }
})(jQuery);
//function===============================================================================================