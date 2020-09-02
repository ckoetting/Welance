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
            } else {
              document.querySelector(".device-container").style.borderColor = "#E93A7D";
              document.querySelector("#user-title").innerText = "Business details";

            }
          });
