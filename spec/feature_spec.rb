require 'dish'
require 'menu'

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

  def a__given_that_there_are_some_dishes
    @dish_1 = Dish.new('name1', 1)
    @dish_2 = Dish.new('name2', 2)
    @dish_3 = Dish.new('name3', 3)
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
    @order = Order.new
  end
  def e__the_customer_can_add_menu_items_to_order
    @order.add_item
  end

end
