# irb -r './spec/feature_tests.rb'
require './lib/menu'
require './lib/take_away'

def set_up_the_menu_list
  menu = Menu.new
  p menu.list
end

#set_up_the_menu_list

def has_the_list_of_dishes
  menu = Menu.new
  take_away = TakeAway.new(menu)
  p take_away
end

#has_the_list_of_dishes

def read_list_of_dishes
  menu = Menu.new
  take_away = TakeAway.new(menu)
  p take_away.read_menu
end

#read_list_of_dishes

def select_dishes(dish, quantity = 1)
  menu = Menu.new
  take_away = TakeAway.new(menu)
  p take_away.order(dish)
end

select_dishes("schicken")

def basket_summary
  menu = Menu.new
  take_away = TakeAway.new(menu)
  take_away.order("jerk chicken")
  take_away.order("mamas meatballs")
end

basket_summary

def complete_order(price)
  menu = Menu.new
  take_away = TakeAway.new(menu)
  take_away.order("jerk chicken")
  take_away.order("mamas meatballs")
end

complete_order(10.98)
