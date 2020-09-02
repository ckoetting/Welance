// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('user_location');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };


import places from 'places.js';

const initAutocomplete = () => {
  $('#user_user_type').change(function () {
    let value = this.value;
    let addressInput = '';
    if (value === 'Developer') {
      addressInput = document.querySelector('#user_location');
      console.log(addressInput)
    } else {
      addressInput = document.querySelector('#user_business_address');
      console.log(addressInput)
    }
    if (addressInput) {
      places({ container: addressInput });
    }
  })};

  export { initAutocomplete };
