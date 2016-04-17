"use strict";
var Slider = function ($el, options) {
    this.options = $.extend({
        // 默认延迟时间
        delayTime: 5000,

        // 默认动画时间
        animateTime: 1000,
    }, options || {});

    this.$el = $el;
    this.width = this.$el.width();

    this.$list = this.$el.find('.slider-list');

    this.$list.$items = this.$list.children('.slider-item');

    this.total = this.$list.$items.length;

    this.$pages = $('<ol class="slider-pages"></ol>');

    this.render();
};

Slider.prototype = {
    total: 0,     // 总页数
    current: 0,   // 当前页数
    width: 0,     // 全局宽度
    tid: null,    // 计时器

    $el: null,    // jquery对象
    $list: null,  // 图片列表
    $pages: null, // 分页按钮

    render: function () {
        for (var i = 1; i <= this.total; i++) {

            $("<li></li>")
                .data('page', i)
                .appendTo(this.$pages);

        }

        this
        .$list
            .css({width: this.total * 100 + '%'})
        .$items
            .css({width: 100 / this.total + '%'})
            .each(function () {
                var $this = $(this);
                var cover = $this.data('cover');
                if (cover) {
                    $this.css({backgroundImage: 'url(' + cover + ')'});
                }
            });


        var _this = this;

        this.$pages.$items = this.$pages.children('li');

        // 绑定点击事件
        this
        .$pages
        .$items
            .on('click', function () {
                _this.changePage($(this).data('page'));
            });

        this
        .$el
            .append(this.$pages);


        return this.changePage(1);
    },

    changePage: function (page) {
        if (page > this.total) {
            page = 1;
        }
        if (page < 1) {
            page = this.total;
        }

        var left;

        this.current = page - 1;

        // 设置当前active
        this
        .$pages
        .$items
            .removeClass('active')
        .eq(this.current)
            .addClass('active');

        left = this.current * this.width;

        this
        .$list
            .stop()
            .animate({left: -left}, this.options.animateTime);

        return this.auto();
    },

    nextPage: function () {
        return this.changePage(this.current + 2);
    },

    prePage: function () {
        return this.changePage(this.current);
    },

    // 自动下一个
    auto: function () {
        // 清除计时器
        clearTimeout(this.tid);
        var _this = this;
        // 计时器
        this.tid = setTimeout(function () {
            _this.nextPage();
        }, this.options.delayTime);
        return this;
    }
};

$.fn.slider = function (options) {
    var $this = $(this);
    $this.slider = new Slider($this, options);

};
