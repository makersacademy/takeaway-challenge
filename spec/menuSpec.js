'use strict';

describe('Menu', function() {
  var menu;

  beforeEach(function() {
    menu = new Menu();
  });


  describe('viewing the menu', function() {

    it('shows a list of the dishes', function() {
      expect(menu.getDishes()).toEqual({});
    });

    it('displays the price of the dishes', function() {
      dishes = {mozzarella:5, burger:7, fries:3}
      menu.displayDishes(dishes);
      expect(menu.getDishes()).toEqual(dishes);
    });

  });

});
