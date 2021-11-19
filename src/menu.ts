'use strict';

interface Item {
  name: string,
  price: number
}

interface Menu {
  dishes: Item[]
}

class Menu {
  constructor(...dishes:Item[]) {
    this.dishes = dishes;
  }
  listDishes() {
    return Object.entries(this)
  }
}
export = Menu;
