'use strict';

interface Dish {
  name: string,
  price: number
}

interface Cart {
  orders : Dish[];
}

class Cart {
  constructor() {
    this.orders = []
  }
  addDish(newDish: Dish) {
    this.orders.push(newDish);
  }
  showCart(): Dish[] {
    return this.orders
  }
}
// Make sure we only execute that in Node, i. e. our unit tests
if(typeof process === 'object') module.exports = Cart;
