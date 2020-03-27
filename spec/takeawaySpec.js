'use strict'

describe('Takeaway', function(){

  var takeaway;

  beforeEach(function() {
    takeaway = new Takeaway();
  });

  it('lists the dishes with prices', function() {
    expect(takeaway.priceList()).toEqual({Burrito: 7, Taco: 5, Cerveza: 6})
  });
});
