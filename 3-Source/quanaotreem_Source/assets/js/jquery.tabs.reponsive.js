(function($){
    $.fn.extend({
        tabsRepon: function(options) {
            // Đặt các giá trị mặc định
            var defaults = {
                cssactive: "current",
                tabstype: true,
                speed: 500,
                cssgroup: ".tabs-group",
                csscontrol: ".control-tabs",
                csscontrolmo: ".tabs-link",
                csscontent: ".tabs-box"
        };
    var options = $.extend(defaults, options);
    return this.each(function() {
        var opts =options;
        // Đặt tên biến cho element (ul)
        var obj = $(this);     
        // Lấy tất cả thẻ li trong ul
        var controltabs = $(opts.csscontrol, obj);
        var items = $("a", controltabs);
        var controltabsh = $(opts.csscontrolmo, obj);
        var itemsh = $("a", controltabsh);
        var tabscontent = $(opts.csscontent, obj);
        controltabsh.filter(":first").find("a:first").addClass(opts.cssactive);
        var idfirst = controltabsh.filter(":first").find("a:first").attr("href");
        items.filter("[href='" + idfirst + "']").addClass(opts.cssactive);
        mytabsshowhide(idfirst);
        // Thêm sự kiện mouseover và mouseout vào thẻ a
        items.click(function () {
            var idtabs = $(this).attr("href");
            items.removeClass(opts.cssactive);
            $(this).addClass(opts.cssactive);
            itemsh.removeClass(opts.cssactive);
            itemsh.filter("[href='" + idtabs + "']").addClass(opts.cssactive);
            mytabsshowhide(idtabs);
            return false;
        });
        itemsh.click(function () {
            var idtabs = $(this).attr("href");
            itemsh.removeClass(opts.cssactive);
            $(this).addClass(opts.cssactive);
            items.removeClass(opts.cssactive);
            items.filter("[href='" + idtabs + "']").addClass(opts.cssactive);
            mytabsshowhide(idtabs);

            var offset = $(idtabs).parents(opts.cssgroup).offset();
            var hh = $(this).height() * 2;
            var htop = offset.top - hh;
            $("html,body").stop(true, true).animate({ scrollTop: htop }, 500);
            return false;
        });
        function mytabsshowhide(idtab) {
            if (opts.tabstype) {
                tabscontent.removeClass(opts.cssactive).hide();
                $(idtab).addClass(opts.cssactive).fadeIn(opts.speed);
            } else{
                tabscontent.removeClass(opts.cssactive).stop(true, true).animate({ "opacity": 0 }, opts.speed);
                $(idtab).addClass(opts.cssactive).stop(true, true).animate({ "opacity": 1 }, opts.speed);
            }
        }
    });
}
});
})(jQuery);