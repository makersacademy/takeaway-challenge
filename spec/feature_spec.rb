require 'dish'
require 'menu'
require 'order'

describe '__TAKEAWAY FEATURE TESTS__' do

  it 'shows a list of dishes with prices' do
    a__given_that_there_are_some_dishes
    b__the_dishes_can_be_added_to_a_menu
    c__the_menu_can_be_viewed
  end
  it 'allows customer to select a number of several dishes' do
    a__given_that_there_are_some_dishes
    b__the_dishes_can_be_added_to_a_menu
    d__an_order_can_be_created
    e__the_customer_can_add_menu_items_to_order
  end
  it 'calculates the price of the order' do
    a__given_that_there_are_some_dishes
    b__the_dishes_can_be_added_to_a_menu
    d__an_order_can_be_created
    e__the_customer_can_add_menu_items_to_order
    f__the_order_price_is_totalled
  end

  def a__given_that_there_are_some_dishes
    @dish_1 = Dish.new('name1', 5)
    @dish_2 = Dish.new('name2', 2)
    @dish_3 = Dish.new('name3', 4)
  end

  def b__the_dishes_can_be_added_to_a_menu
    @menu = Menu.new
    @menu.add(@dish_1)
    @menu.add(@dish_2)
    @menu.add(@dish_3)
  end

  def c__the_menu_can_be_viewed
    @menu.view_menu
  end

  def d__an_order_can_be_created
    @order_object = Order.new(@menu)
  end

  def e__the_customer_can_add_menu_items_to_order
    @order_object.add_item('name1', 2)
    @order_object.add_item('name2', 1)
    @order_object.add_item('name3', 2)
  end

  def f__the_order_price_is_totalled
    @order_object.update_price
    @order_object.price
  end
end
