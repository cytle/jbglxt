"use strict";

// 判断是否为手机号
function isMobile (value) {

  // 验证移动电话号码 正则表达式

  var reg = /^1[3|4|5|7|8]\d{9}$/;
  return reg.test(value);
}

function isPassword (value) {

  return value.length > 0;
}


// 成功input
function successInput ($obj) {
  $obj
    .closest('.form-group')
      .removeClass("has-error")
      .addClass("has-success")
    .find('.control-label')
      .addClass('hidden');
}

// 错误input
function errorInput ($obj) {

  $obj
    .closest('.form-group')
      .removeClass("has-success")
      .addClass("has-error")
    .find('.control-label')
      .removeClass('hidden');
}

// 错误信息警告框
function errorAlert (text) {

  $('#alterMsg')
    .addClass('alert-danger')
    .removeClass('alert-success')
    .removeClass('hidden')
    .text(text);

}

// 成功信息警告框
function successAlert (text) {

  $('#alterMsg')
    .removeClass('alert-danger')
    .addClass('alert-success')
    .removeClass('hidden')
    .text(text);

}
