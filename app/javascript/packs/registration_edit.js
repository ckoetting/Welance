      $('div#Developer').hide()
      $('div#Business').hide()

    // Show and hide selected div
    $('#user_user_type').change(function () {
      let value = this.value;

      $('div#Developer').hide()
      $('div#Business').hide()
      $('#' + this.value).show();
      if (value === 'Developer') {
        document.querySelector(".device-container").style.borderColor = "#1fa1f2";
        document.querySelector("#user-title").innerText = "Developer details";
        document.querySelector("#user-title").style.color = "#1fa1f2";
      } else {
        document.querySelector(".device-container").style.borderColor = "#E93A7D";
        document.querySelector("#user-title").innerText = "Business details";
        document.querySelector("#user-title").style.color = "#E93A7D";
      }
    });

    const provider = document.querySelector("#user_provider").value

    const current_password_field = document.querySelector(".current_password_field");
    if (provider === 'github') {
      current_password_field.style.display = 'none';
    }
