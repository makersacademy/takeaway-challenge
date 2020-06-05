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

      order.add_dish_to_order(dish)
      expect(menu.dishes).toContain([dish])
    });
  });
});