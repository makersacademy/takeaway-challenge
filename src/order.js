class Order {
  constructor() {
    this.orderItems = []
    this.priceTotal = 0
  }

  addDishToOrder(menuitem) {
    this.orderItems.push(menuitem)
  };

  addDishPrices() {
    this.orderItems.forEach (item => this.priceTotal += item.price);
  };
};
