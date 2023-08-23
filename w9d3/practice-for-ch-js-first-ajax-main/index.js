console.log("Hello from the console!");

// Your code here
const id = "bcb83c4b54aee8418983c2aff3073b3b";
const city = "London,UK";

fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${id}`)
.then(response => {
    if (response.ok) {
      return response.json();
    } else {
      throw response;
    }
  })
