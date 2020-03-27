'use strict';

var Order = function() {
  this.currentOrder = {};
  this.menu = new Menu();
  this.orderTotal = 0;
};

Order.prototype.viewMenu = function(menu) {
  return this.menu.items;
};

Order.prototype.addItems = function (item, quantity) {
  for (var key in this.menu.items) {
    if (this.menu.items.hasOwnProperty(item) === true) {
      return this.currentOrder[item] = quantity;
    }
    else {
      throw new Error("Dish is not in the menu.");
    }
  }
};


};
