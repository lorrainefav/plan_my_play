import 'flatpickr/dist/flatpickr.min.css';
import flatpickr from "flatpickr";

const startDateElement = document.getElementById('start_date');
flatpickr(startDateElement, {
    enableTime: true,
    altInput: true,
    dateFormat: "Y-m-d H:i"});

const endDateElement = document.getElementById('end_date');
flatpickr(endDateElement, {
    enableTime: true,
    altInput: true,
    dateFormat: "Y-m-d H:i"});
