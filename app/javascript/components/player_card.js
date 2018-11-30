const convocation0 = document.getElementById("match_convocations_attributes_0_registration_id");
const convocation1 = document.getElementById("match_convocations_attributes_1_registration_id");
const searchCategory = document.getElementById("search_category");
const searchGenderMen = document.getElementById("search_gender_men");
const searchGenderWomen = document.getElementById("search_gender_women");
const searchSubmitButton = document.getElementById("submit_button");
const searchQuery = document.getElementById("search_query");

$('#player-cards').on('click', '.registration-card', function(e) {

  if ($(e.target.parentElement).hasClass('user-modal') || $(e.target).hasClass('user-modal')) {
    return;
  }
  if (convocation0.value === "") {
    convocation0.value = $(this).data('id');
    searchCategory.value = $(this).data('category');
    searchQuery.value = "";
    if ($(this).data('gender')==='men') {
      searchGenderMen.checked = true;
    }
    if ($(this).data('gender')==='women') {
      searchGenderWomen.checked = true;
    }
    searchSubmitButton.click();
  } else {
    convocation1.value = $(this).data('id');
  }
});
