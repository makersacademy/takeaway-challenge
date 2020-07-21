'use strict';

describe('Feature test', function() {

  var dishes;
  var order;

  beforeEach(function(){
    dishes = new Dishes();
    order = new Order();
    order.select("Americano")
    order.select("Chocolate Sprinkle Doughnut")
    order.select("Chef's Special Seasonal Salad")
  });

  it ('can get the total price of an order', function(){
    expect(order.totalPrice()).toEqual(13);
  });

  it ('can show a receipt', function(){
    expect(order.showReceipt()).toEqual({"Americano": 2.50, "Chocolate Sprinkle Doughnut": 3.50,  "Chef's Special Seasonal Salad": 7.00,})
  });

  it ("can submit an order", function(){
    expect(order.submit()).toEqual("Thank you for submitting your order, you'll receive: Americano,Chocolate Sprinkle Doughnut,Chef's Special Seasonal Salad for a total price of £13.00")
  });
});