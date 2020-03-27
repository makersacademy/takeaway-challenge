'use strict';

describe('Order', function() {

  var dishes;
  var order;

  beforeEach(function(){
    dishes = new Dishes();
    order = new Order();
  });

  it ('can select dishes', function(){
    order.select("Americano")
    expect(order.getSelection()).toEqual(["Americano"]);
  });

});