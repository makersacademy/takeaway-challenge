'use strict';

interface Item {
  name: string,
  price: number
}

class Dish {
  constructor(
    public name: string,
    public price: number,
  ) {
    this.name = name;
    this.price = price;
  }
  getDishName(){
    return this.name
  }
  getDishPrice() {
    return this.price
  }
}