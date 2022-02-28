const toggle = () => {
  const checkboxes = document.querySelectorAll('.filters input');
  console.log(checkboxes)
  for (let i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = false;
  };
};

const listenForClearClick = () => {
  const clear = document.getElementById('clear-filters');
  clear.addEventListener("click", (e) => {
    console.log(e);
    toggle();
  });
};

export { listenForClearClick };
