class Menu {
  constructor(){
    this.items = {
      fries: {
        name: 'fries', price: 1.99
      },
      cheeseburger: {
        name: 'cheeseburger', price: 3.99
      },
      coke: {
        name: 'coke', price: 0.99
      },
      fanta: {
        name: 'fanta', price: 0.99
      },
      nachos: {
        name: 'nachos', price: 3.99
      },
      burger_combo: {
        name: 'burger_combo', price: 4.99
      },
      pizza: {
        name: 'pizza', price: 8.99
      },
      chicken_burger: {
        name: 'chicken_burger', price: 3.99
      },
      mozzarella_sticks: {
        name: 'mozzarella_sticks', price: 2.99
      },
      milkshake: {
        name: 'milkshake', price: 1.99
      },
      garden_salad: {
        name: 'garden_salad', price: 2.99
      },
      quinoa_salad: {
        name: 'quinoa_salad', price: 3.99
      },
      ice_cream: {
        name: 'ice_cream', price: 3.99
      }
    }
  }

  listItems(){
    return this.items
  }
/*
  addItem(item, cost, callBack = this.whiteSpace){
    let result = callBack(item)
    if (result == false)
      this.items.push({item: {name: 'item', price: cost}})
    else 
      return "Please enter an item with no whitespace"
  }

  whiteSpace(item){
    return item.indexOf(' ') >= 0;
  }

*/
}

module.exports = Menu