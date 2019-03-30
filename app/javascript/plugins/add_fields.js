const addFields = () => {
  const list = document.querySelector('#invite-friends');
  document.querySelectorAll(".material-icons").forEach((icon) => {
    icon.addEventListener("click", (event) => {
      list.insertAdjacentHTML('beforeend', "<input type='text' name='emails[]'' id='emails_' class='special_input'>");

    });
  });
};
