// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// require turbolinks
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootsy
//= require_tree .
//= require twitter/bootstrap
//= require underscore
//= require gmaps/google

$(document).ready(function(){
	$(".demo").bootstrapNews({
		newsPerPage: 3,
		navigation: false,
		autoplay: true,
		direction:'up', // up or down
		animationSpeed: 'normal',
		newsTickerInterval: 3000, //3 secs
		pauseOnHover: true,
		onStop: null,
		onPause: null,
		onReset: null,
		onPrev: null,
		onNext: null,
		onToDo: null
	});
});