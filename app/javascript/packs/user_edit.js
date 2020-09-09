      const user_type = document.querySelector('#user_type').value
      const provider = document.querySelector("#user_provider").value
      const user_type_dropdown = document.querySelector("#user_user_type");
      user_type_dropdown.style.display = 'none';

      if (user_type === 'Developer') {
        $('div#Business').hide()
        document.querySelector("#user-title").innerText = "Developer details";
        document.querySelector("#user-title").style.color = "white";
      } else {
        $('div#Developer').hide()
        document.querySelector("#user-title").innerText = "Business details";
        document.querySelector("#user-title").style.color = "white";
      }

      const current_password_field = document.querySelector(".current_password_field");
      if (provider === 'github') {
        current_password_field.style.display = 'none';
      }
