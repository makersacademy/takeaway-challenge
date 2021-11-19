'use strict';
class Menu {
    constructor(...dishes) {
        this.dishes = dishes;
    }
    listDishes() {
        return Object.entries(this);
    }
    addDish(dish) {
        this.dishes.push(dish);
    }
}
module.exports = Menu;
