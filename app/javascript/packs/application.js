// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { mobileMenuNav} from '../components/navbar';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initChatroomCable } from '../channels/chatroom_channel'

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  mobileMenuNav();
  initAutocomplete();
  initChatroomCable();
  // var select = function(s) {
  //   return document.querySelector(s);
  // }
  // function randomBetween(min,max)
  // {
  //     var number = Math.floor(Math.random()*(max-min+1)+min);

  //     if ( number !== 0 ){
  //       return number;
  //     }else {
  //       return 0.5;
  //     }
  // }
  // var tl = new TimelineMax();

  // for(var i = 0; i < 20; i++){

  //   var t = TweenMax.to(select('.bubble' + i), randomBetween(1, 1.5), {
  //     x: randomBetween(12, 15) * (randomBetween(-1, 1)),
  //     y: randomBetween(12, 15) * (randomBetween(-1, 1)),
  //     repeat:-1,
  //     repeatDelay:randomBetween(0.2, 0.5),
  //     yoyo:true,
  //     ease:Elastic.easeOut.config(1, 0.5)
  //   })

  //   tl.add(t, (i+1)/0.6)
  // }

  // tl.seek(50);
  // initMapbox();
});
