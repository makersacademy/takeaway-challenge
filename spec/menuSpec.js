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

  });
  
});
