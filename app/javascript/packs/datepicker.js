import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"



// const startDateElement = document.getElementById('start_date');
// const endDateElement = document.getElementById('end_date');

// flatpickr(startDateElement, {
//   minDate: "today",
//   altInput: true,
//   enableTime: true,
//   altFormat: "F j, Y",
//   dateFormat: "Y-m-d H:i",
//   "plugins": [new rangePlugin({ input: endDateElement})]
// });


const datepickers = document.querySelectorAll(".datepicker")

datepickers.forEach((date_input) => {
  const startDateElement = document.getElementById('start_date');
  const endDateElement = document.getElementById('end_date');
  flatpickr(startDateElement, {
    minDate: "today",
    altInput: true,
    enableTime: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d H:i",
    "plugins": [new rangePlugin({ input: endDateElement})]
  });
})
