describe('Order', function() {

  beforeEach(function() {
    order = new Order();
  })

  describe('addDishToOrder', function(){
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
  });
  describe('addDishPrices', function(){
    it ('can fetch the total order price', function () {
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
      expect(order.priceTotal).toEqual(6.98);
    });
  });

  describe('submitOrder', function(){
    it ('can change the orderStatus to complete', function () {
      order.submitOrder();
      expect(order.orderStatus).toEqual('Out for Delivery');
    });
  });

  describe('completeOrder', function(){
    it ('can change the orderStatus to complete', function () {
      order.deliveryComplete();
      expect(order.orderStatus).toEqual('Delivered');
    });
  });
});