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
  it 'checks that the payment is equal to the price total' do
    a__given_that_there_are_some_dishes
    b__the_dishes_can_be_added_to_a_menu
    d__an_order_can_be_created
    e__the_customer_can_add_menu_items_to_order
    f__the_order_price_is_totalled
    g__the_given_payment_is_checked_to_equal_the_total
  end
  it 'sends the customer a confirmation text message' do

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
    expect(@menu.view_menu.to_a).to eq ["name1 - 5", "name2 - 2", "name3 - 4"]
  end

  def d__an_order_can_be_created
    @new_order = Order.new(@menu)
  end

  def e__the_customer_can_add_menu_items_to_order
    @new_order.add_item('name1', 2)
    @new_order.add_item('name2', 1)
    @new_order.add_item('name3', 2)
    expect(@new_order.order.to_a).to eq [["name1", 2], ["name2", 1], ["name3", 2]]
  end

  def f__the_order_price_is_totalled
    @new_order.update_price
    expect(@new_order.price).to eq 20
  end

  def g__the_given_payment_is_checked_to_equal_the_total
    expect { @new_order.pay(10) }.to raise_error 'You must give the exact amount.'
  end

end
