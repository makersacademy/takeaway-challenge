'use strict';

describe('Dish', function() {

  var dish;

  beforeEach(function() {
    dish = new Dish("Peperoni", 850, "Peperoni slices, tomato base");
  });

  it('can have a name', function() {
    expect(dish.name).toEqual("Peperoni");
  });

  it('can have a price in pence', function() {
    expect(dish.price).toEqual(850);
  });

  describe('displayPrice()', function(){
    it('converts price to pounds to be used in price display', function() {
      expect(dish.displayPrice()).toEqual("£8.50");
    });
  
    it('also converts no matter how high the price', function() {
      var deluxe = new Dish("Expensive Pizza", 999999);
      expect(deluxe.displayPrice()).toEqual("£9999.99");
    });
  })

  it('can have an optional description', function() {
    expect(dish.description).toEqual("Peperoni slices, tomato base");
  });

  it('description reads "no info" if description no provided', function() {
    var blandDish = new Dish("Boring", 100);
    expect(blandDish.description).toEqual("no info");
  });

});
