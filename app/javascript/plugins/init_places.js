const list = document.querySelector('#results');


const searchAlgoliaPlaces = (query) => {
  fetch("https://places-dsn.algolia.net/1/places/${query}", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      data.words.forEach((word) => {
        const country = `<li>
          <p>${word}</p>
        </li>`;
        list.insertAdjacentHTML("beforeend", country);
      });
    });
};

const form = document.querySelector('.create-trip-first > form')
const input = document.querySelector(".search");

// if (form) {

//   form.addEventListener("keyup", (event) => {
//     event.preventDefault();
//     document.querySelector('#results').innerHTML = "";
//     searchAlgoliaPlaces(form.value);
//   });






// }
export { searchAlgoliaPlaces };
