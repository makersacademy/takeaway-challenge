'use strict';
/* We are using this for now (though we do certainly not like it). #
In the long run it should come from the db. */
const DISH_LIST = [
    new Dish('Risotto', 13.50),
    new Dish('Paella', 9.95),
    new Dish('Spanakopita', 14.99)
];
window.addEventListener('DOMContentLoaded', (event) => {
    const pageMenu = document.querySelector('#menu');
    const MENU = new Menu(...DISH_LIST);
    const WHAT_IS_ON_THE_MENU = MENU.listDishes();
    if (pageMenu !== null) {
        WHAT_IS_ON_THE_MENU.forEach((dish) => {
            let newDishEntry = document.createElement("li");
            newDishEntry.innerHTML = `${dish.name}: ${dish.price.toFixed(2)}\u{20AC}`;
            newDishEntry.className = "dish";
            pageMenu.appendChild(newDishEntry);
        });
    }
});
