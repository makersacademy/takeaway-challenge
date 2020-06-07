'use strict';

describe('Takeaway', function() {

  var takeaway;

  beforeEach(function() {
    takeaway = new Takeaway();
  });

  it('balance starts at 0 pounds', function() {
    expect(takeaway.getCurrentBalance()).toEqual(0);
  });

  it('increases balance with addFood()', function() {
    takeaway.addFood('Burger',5);
    expect(takeaway.getCurrentBalance()).toEqual(5);
  });

  it('adds food to order with addFood()', function() {
    takeaway.addFood('Burger',5);
    expect(takeaway.getCurrentOrder()).toEqual(['Burger']);
  });
  
  it('increases balance with removeFood()', function() {
    takeaway.addFood('Burger',5);
    takeaway.removeFood('Burger',5);
    expect(takeaway.getCurrentBalance()).toEqual(0);
  });
  
  it('removes food from order with removeFood()', function() {
    takeaway.addFood('Burger',5);
    takeaway.removeFood('Burger',5);
    expect(takeaway.getCurrentOrder()).toEqual([]);
  });
  
  it('has a minimum of 0 balance', function() {
    takeaway.addFood('Burger',5);
    takeaway.addFood('Burger',5);
    for (var i = 0; i < 5; i++) {
      takeaway.removeFood('Burger',5);
    }
    expect(takeaway.getCurrentBalance()).toEqual(0);
  });
});