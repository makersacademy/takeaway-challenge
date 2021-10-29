class Menu {
  constructor(){
    this.items = {
      fries: {
        name: 'Fries', price: 1.99, id: 1
      },
      cheeseburger: {
        name: 'Cheeseburger', price: 3.99, id: 2
      },
      coke: {
        name: 'Coke', price: 0.99, id: 3
      },
      fanta: {
        name: 'Fanta', price: 0.99, id: 4
      },
      nachos: {
        name: 'Nachos', price: 3.99, id: 5
      },
      burger_combo: {
        name: 'Burger Combo', price: 4.99, id: 6
      },
      pizza: {
        name: 'Pizza', price: 8.99, id: 7
      },
      chicken_burger: {
        name: 'Chicken Burger', price: 3.99, id: 8
      },
      mozzarella_sticks: {
        name: 'Mozzarella Sticks', price: 2.99, id: 9
      },
      milkshake: {
        name: 'Milkshake', price: 1.99, id: 10
      },
      garden_salad: {
        name: 'Garden Salad', price: 2.99, id: 11
      },
      quinoa_salad: {
        name: 'Quinoa Salad', price: 3.99, id: 12
      },
      ice_cream: {
        name: 'Ice Cream', price: 3.99, id: 13
      }
    }
  }

  listItems(){
    return this.items
  }

  findById(param){
    let a = Object.values(this.items)
    let result = a.find(x => x.id === param)
    return result
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