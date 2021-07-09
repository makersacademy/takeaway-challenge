class Takeaway {

  constructor() {
    this.menu = [
      ['Salad', 5],
      ['Gyoza', 7],
      ['Veggie Pizza', 10],
      ['Meat Pizza', 11],
      ['Beef Burger', 10],
      ['Veggie Burger', 9],
      ['Fries', 4],
      ['Ice Cream', 5],
      ['Chocolate Bar', 2],
      ['Soft Drink', 1],
      ['Beer', 4],
      ['Water', 2],
      ['Hot Drink', 2]
    ];
    this.order = [];
  };

  printMenu() {
    return this.menu;
  };

  customerOrder() {
    for (let i = 0; i < arguments.length; i++) {
      this.order.push(arguments[i]);
    };
  };

  printOrder() {
    return this.order;
  };

  orderTotal() {
    let orderItems = [];
    for (let i = 0; i < arguments.length; i++) {
      for (let j = 0; j < this.menu.length; j++) {
        if (arguments[i] === this.menu[j][0]) {
          orderItems.push(this.menu[j]);
        };
      };
    };
    let orderPrices = [];
    for (let i = 0; i < orderItems.length; i++) {
      orderPrices.push(orderItems[i][1]);
    }
    return orderPrices.reduce((a, b) => a + b, 0);
  };
};
