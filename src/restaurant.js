const Order = require('./order')
const Menu = require('./menu')


//I need to figure out to to make sure Orders persist. Whether we store in DB as soon as its started or when its completed
//May have to store it in session somehow 
class Restaurant {
  constructor (name, menu = new Menu , orderClass = new Order) {
    this.name = name
    this.menu = menu
    this.currentOrder = orderClass
    this.delivery = 2.99
    this.orderHistory = []
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
      //let 
      //this.currentOrder.dishes.forEach(element => element.id)
      return (this.currentOrder.getTotal()) + this.delivery
  }

  clearOrder(){
    this.currentOrder = new Order
  }

}

module.exports = Restaurant
