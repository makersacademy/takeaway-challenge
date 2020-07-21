'use strict';

describe('Dishes', function() {

  var dishes;

  beforeEach(function(){
    dishes = new Dishes();
  });

  it ('has 10 dishes', function(){
    expect(Object.keys(dishes.all()).length).toEqual(10);
  });

  it ('can show the correct price', function(){
    expect(dishes.all().Americano).toEqual(2.50)
    });
  
  it('stores all dishes', function(){
    expect(Object.keys(dishes.all())).toEqual(["Americano", 
                                              "Cappuccino", 
                                              "Espresso", 
                                              "Flat White", 
                                              "Custard Doughnut", 
                                              "Chocolate Sprinkle Doughnut", 
                                              "Smoked Salmon and Cream Cheese Bagel", 
                                              "Avocado and Scrambled Egg Bagel", 
                                              "Vegan BLT Bagel", 
                                              "Chef's Special Seasonal Salad"])
  });
});