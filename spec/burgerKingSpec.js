describe('Burgerking', function(){
  var burgerKing;
  beforeEach(function(){
    burgerKing = new Burgerking();
  });
  it('can make an instance of Burgerking',function(){
  expect(burgerKing = new Burgerking).toBeInstanceOf(Burgerking)
  });

  it('can see list of dishes with prices',function(){
    expect(burgerKing.getMenu()).toEqual({"Whopper":4.49,"Chicken Royale":4.49,"Prawn burger":3.79})
  });
  });
