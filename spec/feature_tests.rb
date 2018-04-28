# irb -r './spec/feature_tests.rb'
require './lib/menu'

def set_up_the_menu_list
  menu = Menu.new
  p menu.list
end

set_up_the_menu_list
