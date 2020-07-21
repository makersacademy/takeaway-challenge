'use strict';

class Takeaway {
  constructor() {
    this.balance = 0;
    this.order = [];
  }
  getCurrentBalance() {
    return this.balance;
  }
  getCurrentOrder() {
    return this.order;
  }
  addFood(food, price) {
    this.order.push(food)
    this.balance += price
  }
  removeFood(food, price) {
    if (this._isMinimumBalance()) {
      return;
    }
    const index = this.order.indexOf(food);
    if (index > -1) {
      this.order.splice(index, 1);
  }
    this.balance -= price
  }
  _isMinimumBalance() {
    return this.balance === 0;
  }
};