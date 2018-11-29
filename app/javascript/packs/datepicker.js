import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

function initDatepickers() {

  const datepickers = document.querySelectorAll(".datepicker")

  datepickers.forEach((date_inputs) => {
    const startDateElement = date_inputs.querySelector('#start_date');
    const endDateElement = date_inputs.querySelector('#end_date');
    flatpickr(startDateElement, {
      minDate: "today",
      altInput: true,
      static: true,
      enableTime: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d H:i",
      "plugins": [new rangePlugin({ input: endDateElement})]
    });
  })

  const matchDateElement = document.querySelector('#match-time');
  if (matchDateElement) {
    flatpickr(matchDateElement, {
      minDate: "today",
      altInput: true,
      enableTime: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d H:i",
    });
  }

}

export { initDatepickers };
