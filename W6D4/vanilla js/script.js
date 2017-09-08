document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const formEl = document.getElementById("form_favorite");
  formEl.addEventListener("submit", event => {
    // **cancel** the event; if the event were not canceled the browser
    // would try to submit the form for real.
    event.preventDefault();

    // Get the name input element (type `HTMLInputElement`), get the
    // value, and clear it.
    const fav_input = document.getElementsByClassName("favorite-input")[0]
    const fav_place = fav_input.value;
    fav_input.value = "";

    // Get the ul of places.
    const ul = document.getElementById("sf-places");
    // create an li element
    const li = document.createElement("li");
    // set the text of the li to be the value of the input field
    li.textContent = fav_place;

    // insert it as the last item in the ul.
    ul.appendChild(li);
  });
  // --- your code here!



  // adding new photos
  const toggleImg = (e) => {
    const imgForm = document.getElementsByClassName('photo-form-container')[0];
    if (imgForm.className === 'photo-form-container hidden') {
      imgForm.className = 'photo-form-container';
    } else {
      imgForm.className = 'photo-form-container hidden';
    }
  };

  const showbttn = document.getElementsByClassName('photo-show-button')[0];
  showbttn.addEventListener("click", toggleImg);
  // --- your code here!

  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newPhotoLi);
  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);
});
