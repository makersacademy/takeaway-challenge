'use strict';

  // Yes, there is one. this is about programming and web development.
  const DISH_DESCRIPTION = "Aliquam eleifend nulla eget sollicitudin vulputate. \
    Donec lorem dolor, aliquet ut mauris id, auctor maximus ligula. \
    Phasellus ut lacus sollicitudin, convallis mauris quis, elementum arcu. \
    Quisque id quam id nisi."
  /* We are using this for now (though we do certainly not like it). #
  In the long run it should come from the db. */

  const DISH_LIST = [
    new Dish('Risotto', 13.50, DISH_DESCRIPTION),
    new Dish('Paella', 9.95, DISH_DESCRIPTION),
    new Dish('Spanakopita', 14.99, DISH_DESCRIPTION),
    new Dish('Lobster', 74.99, DISH_DESCRIPTION),
    new Dish('Hanger Steak', 7.99, DISH_DESCRIPTION),
    new Dish('Scotch Egg', 24.38, DISH_DESCRIPTION),
    new Dish('Galette', 12.24, DISH_DESCRIPTION),
    new Dish('Clafoutis', 56.78, DISH_DESCRIPTION),
    new Dish('Poached Pears', 99.99, DISH_DESCRIPTION),
];

window.addEventListener('DOMContentLoaded', () => {

  const pageMenu = document.querySelector('#menu')
  const MENU = new Menu(...DISH_LIST)
  const WHAT_IS_ON_THE_MENU = MENU.listDishes()
  if(pageMenu !== null) {
    WHAT_IS_ON_THE_MENU.forEach( (dish) => {
      
      const NEW_DISH_NAME = document.createElement("h4");
      NEW_DISH_NAME.innerHTML = dish.name;
      NEW_DISH_NAME.className = "dish-name"
      const NEW_DISH_DESCRIPTION = document.createElement("p");
      NEW_DISH_DESCRIPTION.innerHTML = dish.description;
      NEW_DISH_DESCRIPTION.className = "dish-description"
      const NEW_DISH_PRICE = document.createElement("p");
      NEW_DISH_PRICE.innerHTML = `${dish.price.toFixed(2)}\u{20AC}`;
      NEW_DISH_PRICE.className = "dish-price"
      const ADD_TO_CARD = document.createElement("button")
      ADD_TO_CARD.innerHTML = "Add to Cart"
      ADD_TO_CARD.className = "add-to-cart"
      
      
      const NEW_DISH_ENTRY = document.createElement("div");
      NEW_DISH_ENTRY.appendChild(NEW_DISH_NAME)
      NEW_DISH_ENTRY.appendChild(ADD_TO_CARD)
      NEW_DISH_ENTRY.appendChild(NEW_DISH_DESCRIPTION)
      NEW_DISH_ENTRY.appendChild(NEW_DISH_PRICE)
      NEW_DISH_ENTRY.className = "dish"
      pageMenu.appendChild(NEW_DISH_ENTRY)
    })
}
});
