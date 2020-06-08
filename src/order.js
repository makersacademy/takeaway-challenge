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
    var orderQuantities = {};
    console.log("order quantities before" + orderQuantities)
    this.orderItems.forEach (item => {
        if (item.name in orderQuantities) {
        orderQuantities[item.name] += 1;
      } else {
        orderQuantities[item.name] = 1
    }});
    console.log("order quantities after" + orderQuantities);
    return orderQuantities;
  };

  deliveryComplete() {
    this.orderStatus = 'Delivered'
  }
};
