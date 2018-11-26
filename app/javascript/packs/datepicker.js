import 'flatpickr/dist/flatpickr.min.css';
import flatpickr from "flatpickr";

const startDateElement = document.getElementById('start_date');
const endDateElement = document.getElementById('end_date');

flatpickr(startDateElement, {
    enableTime: false,
    altInput: true,
    dateFormat: "Y-m-d"});


flatpickr(endDateElement, {
    enableTime: false,
    altInput: true,
    dateFormat: "Y-m-d"});
