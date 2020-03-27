'use strict';

describe('taking order', function() {
  var order;
  var menu;

  beforeEach(function() {
    menu = new Menu();
    order = new Order();
  });

  describe('view the menu', function() {
    it('can list all the items from the menu', function() {
      expect(order.viewMenu(menu)).toEqual(jasmine.objectContaining({"Mozza": 5, "Burger": 7, "Fries": 3}));
    });

    it('can add items to the order', function() {
      order.addItems("Burger", 7);
      expect(order.currentOrder).toEqual(jasmine.objectContaining({"Burger": 7}));
    });

    it('raises error when item requested is not in the menu', function() {
      expect( function(){order.addItems("Beer", 3);} ).toThrow(new Error("Dish is not in the menu."));
    });
  });

  // describe('gives the total of the order', function() {
  //   it('shows the total amount', function() {
  //     order.addItems("Burger", 7);
  //     order.addItems("Mozza", 5);
  //     order.amountOrder();
  //     expect(order.orderTotal).toEqual(12);
  //   });
  // });
});
