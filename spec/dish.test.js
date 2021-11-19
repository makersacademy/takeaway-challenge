'use strict';

const Dish = require('../src/dish.js');
describe('Dish', () => {

  test('has a price and a name', () => {
    const tasty_dish = new Dish('Pizza', 5.00);
    const not_so_tasty_dish = new Dish('Old Soup', 0.50);

    expect(tasty_dish.getDishName()).toBe('Pizza');
    expect(not_so_tasty_dish.getDishName()).toBe('Old Soup');
    expect(tasty_dish.getDishPrice()).toBe(5.00);
    expect(not_so_tasty_dish.getDishPrice()).toBe(0.50);
  });
  
});
