import "bootstrap";

import "./search_city";
import { initDatepickers } from './datepicker';
initDatepickers();

import '../components/player_card'
//import '../components/registrations_filters'


window.closeBootstrapModal = function (id) {
  $(id).modal('hide');
}


import * as dragula from 'dragula';
dragula([].slice.call(document.querySelectorAll('.dropable')));
