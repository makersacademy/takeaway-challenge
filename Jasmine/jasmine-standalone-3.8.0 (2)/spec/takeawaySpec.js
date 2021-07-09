describe('Takeaway', () => {
  let takeaway;

  beforeEach(() => {
    takeaway = new Takeaway();
  });

  it('has dishes on the menu', () => {
    expect(takeaway.menu).toContain(['Meat Pizza', 11]);
  });

  // As a customer
  // So that I can check if I want to order something
  // I would like to see a list of dishes with prices

  it('allows customers to see a list of dishes and prices', () => {
    expect(takeaway.printMenu()).toContain(['Salad', 5]);
    expect(takeaway.printMenu()).toContain(['Beer', 4]);
  });

  // As a customer
  // So that I can order the meal I want
  // I would like to be able to select some number of several available dishes

  it('allows customers to order a number of items from the menu', () => {
    takeaway.customerOrder('Salad', 'Veggie Burger', 'Fries', 'Beer');
    expect(takeaway.printOrder()).toEqual(['Salad', 'Veggie Burger', 'Fries', 'Beer']);
  });

  // As a customer
  // So that I can verify that my order is correct
  // I would like to check that the total I have been given matches the sum of the various dishes in my order

  it('returns a total price for an order', () => {
    expect(takeaway.orderTotal('Gyoza', 'Beef Burger', 'Fries', 'Ice Cream', 'Soft Drink')).toEqual(27)
  });
});

  // As a customer
  // So that I am reassured that my order will be delivered on time
  // I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
