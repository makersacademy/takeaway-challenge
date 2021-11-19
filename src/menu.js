'use strict';
class Menu {
    constructor(...dishes) {
        this.dishes = dishes;
    }
    listDishes() {
        return Object.entries(this);
    }
}
module.exports = Menu;
