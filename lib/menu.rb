require './lib/order.rb'
class Menu

attr_reader :menu

def initialize
@menu = {}
menu[:hawaiian] = 7
menu[:meat_feast] = 9
menu[:spicy_chicken] = 8
menu[:chicken_wings] = 3
menu[:ham_pineapple] = 9.5
menu[:cheese] = 7.5
menu[:anchovy] = 8
menu[:duck] = 10.5
menu[:vegetarian] = 6

end

def menu_list
  menu
end


end
