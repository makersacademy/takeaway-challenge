describe('Feature Test:', function(){
  var dish;
  var order;
  var menu;

  beforeEach(function(){
    dish = new Dish("Cheeseburger", 4.99);
    dish2 = new Dish("Chips", 1.99);
    order = new Order();
    menu = new Menu();
  });

  it ('can order multiple dishes from the Menu', function(){
    menu.add_dish(dish);
    menu.add_dish(dish2);
    cheeseburger = menu.dishes[0];
    chips = menu.dishes[1];
    order.addDishToOrder(cheeseburger);
    order.addDishToOrder(chips);
    expect(order.orderItems).toContain(cheeseburger);
    expect(order.orderItems).toContain(chips);
  });
});
