require 'dish'
require 'menu'

describe '__TAKEAWAY FEATURE TESTS__' do

  it 'shows a list of dishes with prices' do
    given_that_there_are_some_dishes
    the_dishes_can_be_added_to_a_menu
    # the_menu_can_be_viewed
  end

  def given_that_there_are_some_dishes
    dish_1 = Dish.new('name1', 1)
    dish_2 = Dish.new('name2', 2)
    dish_2 = Dish.new('name3', 3)
  end

  def the_dishes_can_be_added_to_a_menu
    menu = Menu.new
  end

end
