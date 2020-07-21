class Order {
  constructor() {
    this.selection = []
    this.price = 0
    this.receipt = {}
  }

  select(dishName) {
    this.selection.push(dishName)
  }

  unselect(dishName) {
    for(var i = this.selection.length - 1; i >= 0; i--) {
      if(this.selection[i] == dishName) {
          this.selection.splice(i, 1);
      }
    }
    delete this.receipt[dishName]
    return this.selection
  }

  getSelection() {
    return this.selection
  }

  calculateCost() {
    if(this.price === 0) {
      var dishes = new Dishes()
      this.selection.forEach(name => this.price += dishes.all()[name])
    } else {
      return;
    }
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

  submit() {
    return `Thank you for submitting your order, you'll receive: ${this.selection} for a total price of £${this.totalPrice().toFixed(2)}`
  }
}