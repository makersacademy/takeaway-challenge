class Takeaway {
  constructor() {
    this.menu = [];
    this.cart = [];
  }

  addToMenu(dish) {
    this.menu.push(dish);
  }

  getMenu() {
    return this.menu;
  }

  addToCart(id) {
    this.cart.push(this.menu[id]  );
  }

  getCart() {
    return this.cart;
  }

  getBill() {
    return this.cart.reduce((total, dish) => {
      return dish.getPrice() + total;
    }, 0);
  }

  order() {
    return `Thank you! Your order was placed and will be delivered before ${this._getDeliveryTime(new Date())}h`;
  }

  _getDeliveryTime(orderTime) {
    let deliveryTime = (orderTime.getHours() === 23) 
        ? `00:${orderTime.getMinutes()}` 
        : `${orderTime.getHours() + 1}:${orderTime.getMinutes()}`;
        
    return deliveryTime;
  }
}
