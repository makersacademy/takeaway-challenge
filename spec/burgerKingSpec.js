describe('Burgerking', function(){
  var burgerKing;
  it('can make an instance of Burgerking',function(){
  expect(burgerKing = new Burgerking).toBeInstanceOf(Burgerking)
  });

  it('can see list of dishes',function(){
    burgerKing = new Burgerking;
    expect(burgerKing.getMenu()).toContain("Pho")
  });
  });
