'use strict'

describe('Takeaway', function(){

  var takeaway;

  beforeEach(function() {
    takeaway = new Takeaway();
  });

  it('lists the dishes with prices', function() {
    expect(takeaway.takeawayMenu()).toEqual({dish: 'Burrito', price: 7})
  });

  it('can select a dish', function() {
    takeaway.order('Burrito')
    expect(takeaway.customerItems).toContain({ dish: 'Burrito', price: 7})
  });

  it('can select multiple dishes', function() {
    takeaway.order('Taco')
    takeaway.order('Cerveza')
    expect(takeaway.customerItems).toContain({ dish: 'Burrito', price: 7}, {dish: 'Taco', price: 5}, { dish: 'Cerveza', price: 6})
  });
});
// As a customer
// So that I can order the meal I want
// I would like to be able to select some number of several available dishes
