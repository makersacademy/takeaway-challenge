'use strict';
class Dish {
    constructor(name, price) {
        this.name = name;
        this.price = price;
        this.name = name;
        this.price = price;
    }
    getDishName() {
        return this.name;
    }
    getDishPrice() {
        return this.price;
    }
}
// Make sure we only execute that in Node, i. e. our unit tests
if (typeof process === 'object')
    module.exports = Dish;
