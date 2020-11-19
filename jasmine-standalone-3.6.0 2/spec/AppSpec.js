'use strict'

describe("Menu", function() {
var choice;
var total;
var complete;
var select;
  //demonstrates the existance of the menu
    it("should return a menu", function() {
      const menu = new Menu();
      expect(menu.items["fish and chips"]).toEqual(4.99);
    });

  
});
