// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon

$(window).ready( function() {

  $("#user_postal_code").jpostal({
      // # 郵便番号の入力欄が１つの場合
      // # 111-1111と1111111のどちらの入力形式でも住所を自動入力してくれる
      postcode: [ "#user_postal_code" ],

      // # 郵便番号の入力欄が3桁-4桁で分かれている場合
      // # postcode : [ '#zipcode1', '#zipcode2' ]
      // # 入力項目フォーマット
      // #   %3  都道府県
      // #   %4  市区町村
      // #   %5  町域
      // #   %6  大口事業所の番地
      // #   %7  大口事業所の名称
      address: {
        "#user_prefecture": "%3", // # 都道府県が入力される
        "#user_city_address": "%4%5", // # 市区町村と町域が入力される
        "#user_building": "%6%7" // # 大口事務所の番地と名称が入力される
      }
  })
})

$(document).ready(function () {
$("#theTarget").skippr({
  // スライドショーの変化 ("fade" or "slide")
  transition : 'slide',
  // 変化に係る時間(ミリ秒)
  speed : 1000,
  // easingの種類
  easing : 'easeOutQuart',
  // ナビゲーションの形("block" or "bubble")
  navType : 'block',
  // 子要素の種類("div" or "img")
  childrenElementType : 'div',
  // ナビゲーション矢印の表示(trueで表示)
  arrows : true,
  // スライドショーの自動再生(falseで自動再生なし)
  autoPlay : true,
  // 自動再生時のスライド切替間隔(ミリ秒)
  autoPlayDuration : 3000,
  // キーボードの矢印キーによるスライド送りの設定(trueで有効)
  keyboardOnAlways : true,
  // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
  hidePrevious : false
});
});