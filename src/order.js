class Order {
  constructor() {
    this.orderItems = []
    this.priceTotal = 0
    this.orderStatus = 'In progress'
  }

  addDishToOrder(menuitem) {
    this.orderItems.push(menuitem)
  };

  addDishPrices() {
    this.orderItems.forEach (item => this.priceTotal += item.price);
  };

  submitOrder() {
    this.orderStatus = 'Out for Delivery'
  }

  deliveryComplete() {
    this.orderStatus = 'Delivered'
  }
};
