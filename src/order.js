class Order {
  constructor() {
    this.order_items = []
  }

  add_dish_to_order(dish) {
    this.order_items.push(dish)
  };
};
