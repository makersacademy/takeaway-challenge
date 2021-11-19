'use strict';

interface Dish {
  name: string,
  price: number
}

interface Menu {
  dishes: Dish[]
}

class Menu {
  constructor(...dishes:Dish[]) {
    this.dishes = dishes;
  }
  listDishes() {
    return this.dishes;
  }
  addDish(dish: Dish) {
    this.dishes.push(dish)
  }
}
// Make sure we only execute that in Node, i. e. our unit tests
if(typeof process === 'object') module.exports = Menu;
