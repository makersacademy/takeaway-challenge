'use strict';
class Dish {
    constructor(name, price) {
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

module.exports = Dish;