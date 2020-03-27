'use strict';

describe('Feature test', function() {

  var dishes;
  var order;

  beforeEach(function(){
    dishes = new Dishes();
    order = new Order();
  });

  it ('can get the total price of an order', function(){
    order.select("Americano")
    order.select("Chocolate Sprinkle Doughnut")
    order.select("Chef's Special Seasonal Salad")
    expect(order.totalPrice()).toEqual(13);
  });

});