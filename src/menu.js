'use strict';
class Menu {
    constructor(...dishes) {
        this.dishes = dishes;
    }
    listDishes() {
        return this.dishes;
    }
    addDish(dish) {
        this.dishes.push(dish);
    }
}
// Make sure we only execute that in Node, i. e. our unit tests
if (typeof process === 'object')
    module.exports = Menu;
