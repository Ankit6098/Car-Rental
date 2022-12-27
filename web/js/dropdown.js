const selectbox = document.querySelector(".selectbox");
const selectboxDisplay = document.querySelector(".selectbox__displayWord");
const submitbtn = document.querySelector(".form__submit-button");

const optionList = document.querySelectorAll(".option-container__option");

selectboxDisplay.addEventListener("click", (e) => {
  e.stopPropagation();
  selectbox.classList.toggle("selectbox--active");
});

function shakeBox() {
  selectbox.classList.add("selectbox--shake");
  setTimeout(() => {
    selectbox.classList.remove("selectbox--shake");
  }, 300);
}

optionList.forEach((option, index) => {
  option.addEventListener("click", (e) => {
    e.stopPropagation();

    let label = option.querySelector("label");
    selectboxDisplay.innerHTML = label.innerHTML;
    selectbox.setAttribute("data-option", label.getAttribute("data-value"));
    selectbox.classList.remove("selectbox--active", "selectbox--unselect");
  });
});

submitbtn.addEventListener("click", () => {
  if (selectbox.classList.contains("selectbox--unselect")) shakeBox();
});

window.addEventListener("click", () => {
  selectbox.classList.remove("selectbox--active");
});
