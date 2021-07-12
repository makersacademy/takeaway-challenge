describe ('TakeAway', () => {
  let takeaway;
  beforeEach( () => {
    takeaway = new TakeAway();
    // let dish = spy
  });

  let addSeveralDishes = () => {
    takeaway.addDish("chow mein", 5);
    takeaway.addDish("fried rice", 3.50);
    takeaway.addDish("prawn crackers", 1.99);
  };

  it('can add a new dish to the menu', () => {
    takeaway.addDish("chow mein", 5);
    expect(takeaway.menu["chow mein"]).toEqual(5)
  });

  it('can display a menu of dishes and prices', () => {
    addSeveralDishes();
    expect(takeaway.showMenu()).toEqual({"chow mein": 5, "fried rice": 3.50, "prawn crackers": 1.99})
  });

  it('allows user to select several of the available dishes', () => {
    addSeveralDishes();
    takeaway.select("chow mein");
    takeaway.select("prawn crackers");
    expect(takeaway.showBasket()).toEqual({"chow mein": 5, "prawn crackers": 1.99});
  });

  it('sums the users basket', () => {
    addSeveralDishes();
    takeaway.select("chow mein");
    takeaway.select("prawn crackers");
    console.log(takeaway.basket)
    expect(takeaway.totalBasket()).toEqual(6.99);
  });

});
