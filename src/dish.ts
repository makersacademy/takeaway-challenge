'use strict';

class Dish {
  constructor(
    public name: string,
    public price: number,
    public description: string,
  ) {
    this.name = name;
    this.price = price;
    this.description = description;
  }
  getDishName(){
    return this.name
  }
  getDishPrice() {
    return this.price
  }
}
// Make sure we only execute that in Node, i. e. our unit tests
if(typeof process === 'object') module.exports = Dish;

