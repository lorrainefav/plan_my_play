const cards = document.querySelectorAll(".player");
const convocation0 = document.getElementById("match_convocations_attributes_0_registration_id")
const convocation1 = document.getElementById("match_convocations_attributes_1_registration_id")

cards.forEach( (card) => {
  card.addEventListener("click", (event) => {
    if (convocation0.value === "") {
      convocation0.value = card.dataset.id
    } else {
      convocation1.value = card.dataset.id
    }
    // console.log(card)
    });
  }
)
