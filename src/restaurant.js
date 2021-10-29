const Order = require('./order')
const Menu = require('./menu')

class Restaurant {
  constructor (name, menu = new Menu , orderClass = new Order) {
    this.name = name
    this.menu = menu
    this.currentOrder = orderClass
    this.delivery = 2.99
  }

  listMenu() {
    return this.menu.items
  }

  addItem(food) {
    this.currentOrder.dishes.push(food)
  }

  completeOrder(){
    if (this.currentOrder.dishes.length == 0)
      return 'Please add items to your order'
    else 
      return (this.currentOrder.getTotal()) + this.delivery
  }

  clearOrder(){
    this.currentOrder = new Order
  }

}

module.exports = Restaurant
