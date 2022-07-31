'use strict';
class Cart {
    constructor() {
        this.orders = [];
    }
    addDish(newDish) {
        this.orders.push(newDish);
    }
    showCart() {
        return this.orders;
    }
}
// Make sure we only execute that in Node, i. e. our unit tests
if (typeof process === 'object')
    module.exports = Cart;
