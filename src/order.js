class Order {
  constructor(){
    this.dishes = []
  }

  getTotal(){
    let total = 0 
    this.dishes.forEach(element => total += element.price)
    return total
  }

  addItem(item){
    this.dishes.push(item)
  }

  clearOrder(){
    this.dishes = []
  }

  listOrder(){
    let list = []
    this.dishes.forEach(element => list.push(`${element.name} £${element.price}`))
    return list
  }

}

module.exports = Order

