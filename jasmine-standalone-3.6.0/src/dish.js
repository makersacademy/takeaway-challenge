'use strict';

class Dish {
  constructor(name, price, description = "no info") {
    this.name = name;
    this.price = price;
    this.description = description;
  }

  displayPrice() {
    let priceAsString = this.price.toString();
    return "£" + priceAsString.substring(0, priceAsString.length - 2) + "." + priceAsString.substring(priceAsString.length - 2);
  }
}
