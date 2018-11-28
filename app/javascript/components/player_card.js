const convocation0 = document.getElementById("match_convocations_attributes_0_registration_id");
const convocation1 = document.getElementById("match_convocations_attributes_1_registration_id");

$('#player-cards').on('click', '.registration-card', function(e) {
  if (convocation0.value === "") {
    convocation0.value = $(this).data('id');
  } else {
    convocation1.value = $(this).data('id');
  }
});
