class Burgerking {
  constructor(){
    const menu = new Object();
    menu["Whopper"] = 4.49
    menu["ChickenRoyale"] = 4.49
    menu["PrawnBurger"] = 3.79
  }

getMenu () {
  for(const x in menu) {
      console.log(`${x}: ${menu[x]}`);
    }
  return x
};

orderDish (dishname) {
  for(const x in this.menu) {
      console.log(`${x}: ${this.menu[x]}`);
    }
  };
};
