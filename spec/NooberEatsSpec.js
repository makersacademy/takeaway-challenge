'use strict';

describe('NooberEats', () => {
  var restuarant;
  var customer;
  beforeEach(() => {
    restuarant = new NooberEats();
    customer = new Noob();
    order = new order();
  });

  describe('Menu rules', () => {
    it('starts with nil items', () => {
      expect(restuarant.getCurrentItems()).toEqual({});
    });
    it('displays price of items', () => {
      order = { customer:{wings:8,nuggets:4,chips:3} }
      restuarant.getCurrentItems(display);
      expect(restuarant.getCurrentItems()).toEqual(order)
    });
  });
  
  /* describe('Restuarant rules', () => {
    it('can add items', () => {
      restuarant.addItem()
      expect(restuarant.getCurrentItems()).toEqual({ customer: {wings}});
    });
    it('can delete items', () => {
      noob.addItem()
      expect(noob.getCurrentItems()).toEqual({ customer: {wings}});
      noob.removeItem()
      expect(noob.getCurrentItems()).toEqual({ customer:})
    });
  });
 */
  describe('Customer rules', () => {
    it('starts with one customer', () => {
      expect(restuarant.getCurrentItems()).toEqual({ customer: {}});
    });
  });


});