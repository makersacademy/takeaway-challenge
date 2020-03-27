class Order {
  constructor() {
    this.selection = []
    this.price = 0
    this.receipt = {}
  }

  select(dishName) {
    this.selection.push(dishName)
  }

  getSelection() {
    return this.selection
  }

  calculateCost() {
    var dishes = new Dishes()
    this.selection.forEach(name => this.price += dishes.all()[name])
  }

  totalPrice() {
    this.calculateCost()
    return this.price
  }

  showReceipt() {
    var dishes = new Dishes()
    for(var i = 0; i < this.selection.length; i++){
      var dishName = this.selection[i] 
      var price = dishes.all()[this.selection[i]]
      this.receipt[dishName]= price;
    }
    return this.receipt
  }
}