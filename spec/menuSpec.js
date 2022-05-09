'use strict';

describe('Menu', function() {
  var menu;

  beforeEach(function() {
    menu = new Menu();
  });

  describe('display menu', function() {

    it('has 3 dishes', function() {
      expect(menu.items).toEqual(jasmine.objectContaining({"Mozza": 5, "Burger": 7, "Fries": 3}))
    });

  });

});
