class TakeAway {

  constructor() {
    this.menu = {};
    this.basket = {};
  };

  addDish(dish, price) {
    this.menu[dish] = price;
  };

  showMenu() {
    return this.menu;
  };

  select(dish) {
    this.basket[dish] = this.menu[dish];
  };

  showBasket() {
    return this.basket;
  };

  totalBasket() {
    return this._sumHash(this.basket)

  };

  _sumHash(hash) {
    let basket = Object.keys(hash);
    return basket.reduce((sum,key) => sum + hash[key], 0);
  };

};

let takeaway = new TakeAway();
