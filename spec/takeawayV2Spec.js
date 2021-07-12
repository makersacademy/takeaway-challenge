describe ('TakeAway', () => {
  let takeaway;
  let dish;
  let realDish;

  beforeEach( () => {
    takeaway = new TakeAwayV2();
    dish = jasmine.createSpyObj('dish',['name', 'price']);
    noodleDish = new Dish("noodles", 3.50);
    crackerDish = new Dish("prawn crackers", 3.50);
    meatDish = new Dish("chow mein", 5);
  });

  let addSeveralDishes = () => {
    // takeaway.addDish("chow mein", 5);
    // takeaway.addDish("fried rice", 3.50);
    // takeaway.addDish("prawn crackers", 1.99);
    takeaway.addDish(dish);
    takeaway.addDish(dish);
    takeaway.addDish(dish);
  };

  let prepBasket = () => {
    takeaway.addDish(crackerDish);
    takeaway.addDish(meatDish);
    takeaway.select("chow mein");
    takeaway.select("prawn crackers");
  };

  it('can add a new dish to the menu', () => {
    takeaway.addDish(dish);
    expect(takeaway.menu).toEqual([dish])
  });

  it('can display a menu of dishes and prices', () => {
    addSeveralDishes();
    takeaway.addDish(noodleDish)
    expect(takeaway.showMenu().length).toEqual(4)
    expect(takeaway.showMenu()).toEqual([dish, dish, dish, noodleDish])
    expect(takeaway.menu[3].name).toEqual("noodles")
    expect(takeaway.menu[3].price).toEqual(3.50)
  });

  it('allows user to select several of the available dishes', () => {
    prepBasket();
    expect(takeaway.showBasket()[0].name).toEqual("chow mein");
    expect(takeaway.showBasket()[0].price).toEqual(5);
    expect(takeaway.showBasket()[1].name).toEqual("prawn crackers");
  });

  it('sums the users basket', () => {
    prepBasket();
    expect(takeaway.totalBasket()).toEqual(8.50);
  });

});
