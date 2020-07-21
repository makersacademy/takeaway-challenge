'use strict'

class Takeaway {
  constructor() {
    this.customerItems = []
    this.menu =
      {dish: 'Burrito', price: 7},
      {dish: 'Taco', price: 5},
      {dish: 'Cerveza', price: 6}
    }

  takeawayMenu() {
    return this.menu;
  }
  order(dish) {
    // this.menu.select()
    this.customerItems.push(this.menu)
    return this.customerItems;
  }
};
