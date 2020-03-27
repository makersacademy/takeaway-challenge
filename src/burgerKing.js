class Burgerking {
  constructor(){
    this.menu = new Object();
    this.menu["Whopper"] = 4.49
    this.menu["ChickenRoyale"] = 4.49
    this.menu["PrawnBurger"] = 3.79
  }

getMenu () {
  return this.menu
};

orderDish (dishname) {
  for(const x in this.menu) {
      console.log(`${x}: ${this.menu[x]}`);
    }
  };
};
