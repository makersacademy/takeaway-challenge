describe('Menu', function() {

  beforeEach(function() {
    menu = new Menu();
  })

  describe('Menu', function(){
    it ('can return a list of dishes', function () {
      var dish = {
        name : "Cheeseburger",
        price : 4.99
      };

      var dish2 = {
        name : "Hamburger",
        price : 2.99
      };

      menu.add_dish(dish)
      menu.add_dish(dish2)
      expect(menu.dishes).toContain([dish])
      expect(menu.dishes).toContain([dish2])
    });
  });

  describe('add_item', function(){
    it ('can add a dish to the menu', function () {
      var dish = {
        name : "Cheeseburger",
        price : 4.99
      };

      menu.add_dish(dish)
      expect(menu.dishes).toContain([dish])
    });
  });
});