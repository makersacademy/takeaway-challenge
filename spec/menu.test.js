'use strict';

const Menu = require('../src/menu.js');
describe('Menu', () => {

  const mockDish1 = {
    getDishName() { return 'Risotto' },
    getDishPrice() { return 13.50 }
  }
  const mockDish2 = {
    getDishName() { return 'Paella' },
    getDishPrice() { return 9.95 }
  }
  const mockDish3 = {
    getDishName() { return 'Spanakopita' },
    getDishPrice() { return 14.99 }
  }

  test('.listDishes() returns a list of dishes and prices', () => {
    const test_menu = new Menu(mockDish1, mockDish2, mockDish3)
    const whatsOnTheMenu = test_menu.listDishes()
    expect(whatsOnTheMenu).toBe[mockDish1, mockDish2, mockDish3]
  });

  test('.addDish adds a dish to the menu', () => {
    const test_menu = new Menu(mockDish1, mockDish2)
    test_menu.addDish(mockDish3)
    const whatsOnTheMenu = test_menu.listDishes()
    expect(whatsOnTheMenu).toBe[mockDish1, mockDish2, mockDish3]
  });

});
