describe('Cart', function() {
  
  var cart;

  var kiev = {name: "Kiev", price: 800, displayPrice() {return "£8.00"}};
  var fourSeasons = {name: "Four Seasons", price: 800, displayPrice() {return "£8.00"}};
  var margherita = {name: "Margherita", price: 650, displayPrice() {return "£6.50"}};

  beforeEach(function() {
    cart = new Cart();
  });
  
  it('starts as empty', function() {
    expect(cart.contents).toEqual([]);
  });

  it('can add an item', function() {
    cart.add(kiev);
    expect(cart.contents[0].name).toEqual("Kiev");
    expect(cart.contents[0].displayPrice()).toEqual("£8.00");
  });

  it('can remove an item', function() {
    cart.add(fourSeasons);
    cart.add(kiev);
    cart.add(fourSeasons);
    cart.add(kiev);
    cart.remove('Kiev');
    cart.add(fourSeasons);
    cart.remove('Four Seasons');
    expect(cart.contents).toEqual([fourSeasons, kiev, fourSeasons]);
    expect(cart.displayOrder()).toEqual({'Four Seasons': 2, 'Kiev': 1, total: "£24.00"})
  });

  it('totals up the contents of the cart', function() {
    cart.add(kiev);
    cart.add(fourSeasons);
    cart.add(margherita);
    expect(cart.displayTotalPrice()).toEqual("£22.50");
  });

  it('displays names of dishes and their quantities', function() {
    for (let i = 0; i < 5; i++) {
      cart.add(kiev);
    }

    for (let i = 0; i < 3; i++) {
      cart.add(margherita);
    }

    expect(cart.displayOrder()).toEqual({Kiev: 5, Margherita: 3, total: "£59.50"});
  });

});
