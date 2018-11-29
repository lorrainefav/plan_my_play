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
var drake = dragula([].slice.call(document.querySelectorAll('.dropable')));
drake.on('drop', function(el,target){
  let matchId = el.dataset.matchId;
  let date = target.dataset.date;
  let court = target.dataset.court;
  let data = new FormData();
  let url = '/matches/' + matchId;
  data.append('match[begin_at]', date);
  data.append('match[court]', court);
  Rails.ajax({
    type: 'PATCH',
    dataType: "text/javascript",
    url: url,
    data

  });
})




