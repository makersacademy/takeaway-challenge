require_relative '../lib/interface.rb'

def ft_do
  m = Menu.new
  pizza = Dish.new("Pizza", 15)
  goat = Dish.new("Goat", 22)
  m.add_to(pizza)
  m.add_to(goat)
  i = Interface.new(m)
  puts i.see_list
end
