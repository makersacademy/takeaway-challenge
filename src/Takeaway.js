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

  getBill() {
    return this.cart.reduce((total, dish) => {
      return dish.getPrice() + total;
    }, 0);
  }
}
