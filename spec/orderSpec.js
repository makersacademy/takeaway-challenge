describe('Menu', function() {

  beforeEach(function() {
    order = new Order();
  })

  describe('Order', function(){
    it ('can add a dish to the an order', function () {
      var dish = {
        name : "Cheeseburger",
        price : 4.99
      };

      var menu = {
        dishes: []
      };

      order.addDishToOrder(dish)
      expect(order.orderItems).toContain(dish)
    });

    it ('give the order price total', function () {
      var dish = {
        name : "Cheeseburger",
        price : 4.99
      };

      var dish2 = {
        name : "Chips",
        price : 1.99
      };

      var menu = {
        dishes: []
      };

      order.addDishToOrder(dish);
      order.addDishToOrder(dish2);
      order.addDishPrices();
      console.log(order.priceTotal);
      expect(order.priceTotal).toEqual(6.98);
    });
  });
});