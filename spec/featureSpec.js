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

  it ('can show a receipt', function(){
    order.select("Americano")
    order.select("Chocolate Sprinkle Doughnut")
    order.select("Chef's Special Seasonal Salad")
    expect(order.showReceipt()).toEqual({"Americano": 2.50, "Chocolate Sprinkle Doughnut": 3.50,  "Chef's Special Seasonal Salad": 7.00,})
  })

});