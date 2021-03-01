class Cart {
  constructor(contents = []) {
    this.contents = contents;
  }

  add(dish) {
    this.contents.push(dish);
  }

  remove(dishNameString) {
    let removeAt;
    let found = false;
    for (let element = 0; element < this.contents.length; element ++) {
      if (this.contents[element].name === dishNameString) {
        removeAt = element;
        found = true;
      }
    }

    if (found) {
      this.contents.splice(removeAt, 1);
    }
  }

  _totalPrice() {
    let total = 0;
    this.contents.forEach((dish) => {
      total += dish.price;
    });
    return total;
  }

  displayTotalPrice() {
    let priceAsString = this._totalPrice().toString();
    return "£" + priceAsString.substring(0, priceAsString.length - 2) + "." + priceAsString.substring(priceAsString.length - 2);
  }

  displayOrder() {
    let order = {};
    this.contents.forEach((dish) => {
      if(dish.name in order) {
        order[dish.name] += 1;
      } else {
        order[dish.name] = 1;
      }
    });
    order['total'] = this.displayTotalPrice();
    return order;
  }
}
