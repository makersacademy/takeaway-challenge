class Takeaway {
  constructor() {
    this.menu = [];
    this.cart = [];
  }

  addToMenu(dish) {
    this.menu.push(dish);
  }

  getMenu() {
    return this.menu;
  }

  addToCart(id) {
    this.cart.push(this.menu[id]  );
  }

  getCart() {
    return this.cart;
  }
}
