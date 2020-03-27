class Burgerking {
  constructor(){
    this.dishes = {"Whopper":4.49,"Chicken Royale":4.49,"Prawn burger":3.79};
  }

getMenu () {
  return this.dishes
}

orderDish (dishname) {
  return "You have ordered" + " " + "the" + " " + dishname +"." 
}
};
