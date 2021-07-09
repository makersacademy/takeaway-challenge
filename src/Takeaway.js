class Takeaway {
  constructor() {
    this.menu = [];
  }

  addToMenu(dish) {
    this.menu.push(dish);
  }

  getMenu() {
    return this.menu;
  }
}
