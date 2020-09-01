function mobileMenuNav() {
$('.navTrigger').click(function () {
  $(this).toggleClass('active');
  $("#mainListDiv").toggleClass("show_list");
  $("#mainListDiv").fadeIn();
});
};

export { mobileMenuNav };