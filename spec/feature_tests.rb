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
  take_away.order(dish)
  puts "#{quantity}x #{dish}(s) added to your basket"
  p take_away
end

select_dishes("southern chicken")
select_dishes("chicken curry", 2)
select_dishes("southern chicken")
select_dishes("chicken curry", 2)
