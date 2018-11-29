import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const datepickers = document.querySelectorAll(".datepicker")
console.log(datepickers.length)
if (datepickers.length !== 0) {
  datepickers.forEach((date_inputs) => {
    const startDateElement = date_inputs.querySelector('#start_date');
    const endDateElement = date_inputs.querySelector('#end_date');
    flatpickr(startDateElement, {
      minDate: "today",
      altInput: true,
      enableTime: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d H:i",
      "plugins": [new rangePlugin({ input: endDateElement})]
    });
  })

  const matchDateElement = document.querySelector('#match-time');
  flatpickr(matchDateElement, {
      minDate: "today",
      altInput: true,
      enableTime: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d H:i",
    });
}
