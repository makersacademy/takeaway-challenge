'use strict';

const Cart = require('../src/cart.js');
describe('Cart', () => {
  
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

  test('.addDish adds a dish to the cart', () => {
    const testOrder = new Cart();
    testOrder.addDish(mockDish1);
    expect(testOrder.showCart()).toStrictEqual([mockDish1])
  })

  test('.showCart returns all dishes in the cart', () => {
    const testOrder = new Cart();
    testOrder.addDish(mockDish1);
    testOrder.addDish(mockDish2);
    testOrder.addDish(mockDish3);
    expect(testOrder.showCart()).toStrictEqual([mockDish1, mockDish2, mockDish3])
  })

})