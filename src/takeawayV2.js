class TakeAwayV2 {

  constructor() {
    this.menu = [];
    this.basket = [];
  };

  addDish(dish) {
    // this.menu[dish] = price;
    this.menu.push(dish);
  };

  showMenu() {
    // return this.menu;
    return this.menu;
  };

  getDish(dishName, menu=this.menu) {
    let result = menu.find(dish => {
      return dish.name === dishName;
    });
    return result;
  };

  select(name) {
    // this.basket[dish] = this.menu[dish];
    this.basket.push(this.getDish(name));
  };

  remove(name) {
    for(let i=0; i<this.basket.length; i++) {
      if ( this.basket[i].name === name ) {
        this.basket.splice(i, 1);
        break;
      }
    }
  };

  showBasket() {
    return this.basket;
  };

  totalBasket() {
    return this._sumBasket(this.basket)

  };

  _sumSelected(menu) {
    let basket = Object.keys(menu);
    return basket.reduce((sum,dish) => sum + menu[dish], 0);
  };

  _sumBasket(arr) {
    return arr.reduce((sum,dish) => sum + dish.price, 0);
  };

};

let takeaway = new TakeAwayV2();

let buildSampleMenu = () => {
    takeaway.addDish(new Dish("noodles", 5));
    takeaway.addDish(new Dish("rice", 3.50));
    takeaway.addDish(new Dish("prawn crackers", 1.50));
  };
