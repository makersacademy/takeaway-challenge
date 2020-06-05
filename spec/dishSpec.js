describe('Dish', function() {

  beforeEach(function() {
    dish = new Dish('Cheeseburger', 4.99);
  });

  describe('Dish', function() {
    it ('can store the name of dish', function() {
      expect(dish.name).toEqual('Cheeseburger')
    });

    it ('can store the price of dish', function() {
      expect(dish.price).toEqual(4.99)
    });
  });
});

