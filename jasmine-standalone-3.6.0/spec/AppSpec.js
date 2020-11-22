'use strict'

describe("Menu", function() {
 let menu;
 let combined;
 let items;

  //demonstrates the existance of the menu
    it("should return a menu", function() {
      let menu = new Menu();
      expect(menu.items["fish and chips"]).toEqual(4.99);
    });

    it("should allow diner to choose an item", function() {
      let menu = new Menu();
      menu.choice("fish and chips");
      menu.choice("fizzy juice");
      expect(menu.order.length).toEqual(4);
    });

    it("should add up the total price", function() {
      let menu = new Menu();
      menu.choice("fish and chips");
      menu.choice("fizzy juice");
      expect(menu.totals()).toEqual(6.98);
    });

    it("should allow you to reset your selection", function() {
      let menu = new Menu();
      menu.choice("fish and chips");
      menu.choice("fizzy juice");
      menu.reset();
      expect(menu.order.length).toEqual(0);
    })

});
