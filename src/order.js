class Order {
  constructor() {
    this.selection = []
    this.price = 0
  }

  select(dishName) {
    this.selection.push(dishName)
  }

  getSelection() {
    return this.selection
  }

  calculateCost(mealNames) {
    var dishes = new Dishes()
    mealNames.forEach(name => this.price += dishes.all()[name])
  }

  totalPrice() {
    this.calculateCost(this.selection)
    return this.price
  }

}