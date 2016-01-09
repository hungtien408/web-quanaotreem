(function ($) {
    $.fn.extend({
        textHeight: function (options) {
            // Đặt các giá trị mặc định

            var defaults = {
                activetit: true,
                listcss: [{ cssname: ".news-name"}],
                wpointb: true,
                //widthpont: 479,
                desbool: true,
                listpos: [{ cssnamepos: ".desription", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            };

            var options = $.extend(defaults, options);

            return this.each(function () {

                var opts = options;
                // Đặt tên biến cho element (ul)
                var obj = $(this);
                // Lấy tất cả thẻ li trong ul
                var lenw = opts.listcss.length;
                var lendes = opts.listpos.length;
                var myclear;
                myfunh();
                myfunHeight();
                if (opts.wpointb) {
                    $(window).resize(function () {
                        clearTimeout(myclear);
                        myclear = setTimeout(function () {
                            myfunh();
                            myfunHeight();
                        }, 100);
                    });
                }
                function myfunh() {
                        if (opts.activetit) {
                            for (var i = 0; i < lenw; i++) {
                                $(opts.listcss[i].cssname, obj).height("auto");
                            }
                        }
                        if (opts.desbool) {
                            for (var j = 0; j < lendes; j++) {
                                $(opts.listpos[j].cssnamepos, obj).height("auto");
                                $(opts.listpos[j].cssheightnum, obj).height("auto");
                            }
                        }
                }
                function myfunHeight() {
                    var widthtb = obj.width();
                    var widthcol = obj.find(opts.csstr).width();
                    var numcol = Math.round(widthtb / widthcol);
                    var counttd = obj.find(opts.csstr).size();
                    var numrow = parseInt(counttd / numcol);
                    var totalrow = 0;

                    //alert(numcol);
                    if (opts.tbrow) {
                        if (numcol > 1) {
                            if (counttd % numcol == 0) {
                                totalrow = numrow;
                            } else {
                                totalrow = numrow + 1;
                            }
                            for (var i = 0; i < totalrow; i++) {
                                var numi = i * numcol - 1;
                                if (i == 0) {
                                    numi = numcol;
                                    obj.find(opts.csstr).filter(":lt(" + numi + ")").attr("data-row", "row-" + (i + 1));
                                } else {
                                    obj.find(opts.csstr).filter(":gt(" + numi + ")").attr("data-row", "row-" + (i + 1));
                                }
                            }
                        } else {
                            obj.find(opts.csstr).attr("data-row", "row");
                        }
                    }
                    if (opts.max) {
                        if (opts.tbrow) {
                            if (numcol > 1) {
                                if (opts.activetit) {
                                    for (var j = 0; j < totalrow; j++) {
                                        var colm = "[data-row='row-" + (j + 1) + "']";
                                        for (var i = 0; i < lenw; i++) {
                                            var strcol = colm + " " + opts.listcss[i].cssname;
                                            var maxHeight = Math.max.apply(null, $(strcol, obj).map(function () {
                                                return $(this).height();
                                            }).get());
                                            $(strcol, obj).height(maxHeight);
                                        }

                                    }
                                }
                                if (opts.desbool) {
                                    for (var k = 0; k < totalrow; k++) {
                                        var colm = "[data-row='row-" + (k + 1) + "']";
                                        for (var j = 0; j < lendes; j++) {
                                            var strname = colm + " " + opts.listpos[j].cssnamepos;
                                            var maxHeight2 = Math.max.apply(null, $(strname, obj).map(function () {
                                                return $(this).height();
                                            }).get());
                                            var lineh = parseInt($(strname, obj).css("line-height"));
                                            if (maxHeight2 > opts.listpos[j].cssheightnum * lineh) {
                                                $(strname, obj).height(opts.listpos[j].cssheightnum * lineh);
                                            } else {
                                                $(strname, obj).height(maxHeight2);
                                            }
                                        }

                                    }
                                }
                            } 
                        } else {
                            if (opts.activetit) {
                                for (var i = 0; i < lenw; i++) {

                                    var maxHeight = Math.max.apply(null, $(opts.listcss[i].cssname, obj).map(function () {
                                        return $(this).height();
                                    }).get());
                                    $(opts.listcss[i].cssname, obj).height(maxHeight);
                                }
                            }
                            if (opts.desbool) {
                                for (var j = 0; j < lendes; j++) {
                                    var maxHeight2 = Math.max.apply(null, $(opts.listpos[j].cssnamepos, obj).map(function () {
                                        return $(this).height();
                                    }).get());
                                    var lineh = parseInt($(opts.listpos[j].cssnamepos, obj).css("line-height"));
                                    if (maxHeight2 > opts.listpos[j].cssheightnum * lineh) {
                                        $(opts.listpos[j].cssnamepos, obj).height(opts.listpos[j].cssheightnum * lineh);
                                    } else {
                                        $(opts.listpos[j].cssnamepos, obj).height(maxHeight2);
                                    }
                                }
                            }
                        }
                    } else {

                        if (opts.tbrow) {
                            if (numcol > 1) {
                                if (opts.activetit) {
                                    for (var j = 0; j < totalrow; j++) {
                                        var colm = "[data-row='row-" + (j + 1) + "']";
                                        for (var i = 0; i < lenw; i++) {
                                            var strcol = colm + " " + opts.listcss[i].cssname;
                                            var maxHeight = Math.min.apply(null, $(strcol, obj).map(function () {
                                                return $(this).height();
                                            }).get());
                                            $(strcol, obj).height(maxHeight);
                                        }

                                    }
                                }
                                if (opts.desbool) {
                                    for (var k = 0; k < totalrow; k++) {
                                        var colm = "[data-row='row-" + (k + 1) + "']";
                                        for (var j = 0; j < lendes; j++) {
                                            var strname = colm + " " + opts.listpos[j].cssnamepos;
                                            var maxHeight2 = Math.min.apply(null, $(strname, obj).map(function () {
                                                return $(this).height();
                                            }).get());
                                            var lineh = parseInt($(strname, obj).css("line-height"));
                                            if (maxHeight2 > opts.listpos[j].cssheightnum * lineh) {
                                                $(strname, obj).height(opts.listpos[j].cssheightnum * lineh);
                                            } else {
                                                $(strname, obj).height(maxHeight2);
                                            }
                                        }

                                    }
                                }
                            } 
                        } else {
                            if (opts.activetit) {
                                for (var i = 0; i < lenw; i++) {
                                    var maxHeight = Math.min.apply(null, $(opts.listcss[i].cssname, obj).map(function () {
                                        return $(this).height();
                                    }).get());
                                    $(opts.listcss[i].cssname, obj).height(maxHeight);
                                }
                            }
                            if (opts.desbool) {
                                for (var j = 0; j < lendes; j++) {
                                    var maxHeight2 = Math.min.apply(null, $(opts.listpos[j].cssnamepos, obj).map(function () {
                                        return $(this).height();
                                    }).get());
                                    var lineh = parseInt($(opts.listpos[j].cssnamepos, obj).css("line-height"));
                                    if (maxHeight2 > opts.listpos[j].cssheightnum * lineh) {
                                        $(opts.listpos[j].cssnamepos, obj).height(opts.listpos[j].cssheightnum * lineh);
                                    } else {
                                        $(opts.listpos[j].cssnamepos, obj).height(maxHeight2);
                                    }
                                }
                            }
                        }
                    }
                }
            });
        }
    });
})(jQuery);