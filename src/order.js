class Order {
  constructor() {
    this.orderItems = []
  }

  addDishToOrder(menuitem) {
    this.orderItems.push(menuitem)
  };
};
