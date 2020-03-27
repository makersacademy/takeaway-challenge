class Order {
  constructor() {
    this.selection = []
  }

  select(dishName) {
    this.selection.push(dishName)
  }

  getSelection() {
    return this.selection
  }


}