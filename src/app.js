let menu = document.getElementById("menu");
let cart = document.getElementById("cart");
let bill = document.getElementById("bill");
let order = document.getElementById("order");
let confirmation = document.getElementById("confirmation");

let ggDelicatessen = new Takeaway();
let pizza = new Dish('pizza', 12);
let burger = new Dish('burger', 8.5);
let linguini = new Dish('linguini', 11.5);
let chocolateFugdeCake = new Dish('chocolate fudge cake', 7);

addDishesToMenu();
displayMenu()
order.addEventListener('click', sendOrder);

// Functions
function addDishesToMenu() {
  ggDelicatessen.addToMenu(pizza);
  ggDelicatessen.addToMenu(burger);
  ggDelicatessen.addToMenu(linguini);
  ggDelicatessen.addToMenu(chocolateFugdeCake);
}

function displayMenu() {
  ggDelicatessen.getMenu().forEach((dish, id) => {
    let item = document.createElement("li");
    let text = document.createTextNode(`${dish.getName()} - £${dish.getPrice()}`);
  
    let button = document.createElement("button");
    button.id = id;
    button.addEventListener('click', (e) => {
      ggDelicatessen.addToCart(e.target.id);
      updateCart();
      updateBill();
    });
    let buttonText = document.createTextNode("Add ");
    button.appendChild(buttonText);
  
    item.appendChild(text);
    item.appendChild(document.createElement("br"));
    item.appendChild(button);
  
    menu.appendChild(item);
    menu.appendChild(document.createElement("br"));
  });
}

function updateCart() {
  cart.innerHTML = '';

  ggDelicatessen.getCart().forEach((dish) => {
    let item = document.createElement("li");
    let text = document.createTextNode(`${dish.getName()} - £${dish.getPrice()}`);
  
    item.appendChild(text);
    cart.appendChild(item);
  });
}

function updateBill() {
  bill.innerHTML = `Your total bill is £${ggDelicatessen.getBill()}`;
}

function sendOrder() {
  confirmation.innerHTML = ggDelicatessen.order();
}
