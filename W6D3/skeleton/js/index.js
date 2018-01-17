console.log("Hello from the JavaScript console!");

$.ajax({
   type: 'GET',
   url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=c746b08074534bd7100bcd3f1f134975",
   success(data) {
     console.log("We have your weather!");
     console.log(data);
   },
   error() {
     console.error("An error occurred.");
   },
});

console.log("Hot diggity dog!");
