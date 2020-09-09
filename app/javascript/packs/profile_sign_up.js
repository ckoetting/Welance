   const user_type = document.querySelector('#user_type').value
   const provider = document.querySelector("#user_provider").value
   const user_type_dropdown = document.querySelector("#user_user_type");
   const user_title = document.querySelector("#user-title");
  const right_signup_title = document.querySelector("#right-signup-title");
   user_type_dropdown.style.display = 'none';


   if (user_type === 'Developer') {
    $('div#Business').hide()
    user_title.innerText = "Complete developer details";
    user_title.style.color = "white";
       right_signup_title.classList.add("profile_signup-developer");
  } else {
    $('div#Developer').hide()
   user_title.innerText = "Complete business details";
   user_title.style.color = "white";
   right_signup_title.classList.add("profile_signup-business");

 }

 const current_password_field = document.querySelector(".current_password_field");
 if (provider === 'github') {
  current_password_field.style.display = 'none';
}
