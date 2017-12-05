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

//= require jquery
//= require rails-ujs
//= require turbolinks

// Materialize
//-------------------
//= require materialize-sprockets
//= require materialize-form

// Config files
//--------------------
//= require config/namespace

// ActionCable files
//-----------------------
//= require action_cable
//= require config/action_cable
//= require channels/residents/messages
//= require channels/residents/load
// require channels/admins/messages
// require channels/admins/load

// App files
//-----------------------
//= require residents/messages
// require admins/messages