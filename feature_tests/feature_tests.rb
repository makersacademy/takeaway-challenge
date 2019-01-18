require_relative '../lib/interface.rb'

def ft_do
  m = Menu.new
  pizza = Dish.new("Pizza", 15)
  goat = Dish.new("Goat", 22)
  m.add_to(pizza)
  m.add_to(goat)
  i = Interface.new(m)
  puts "see_list = #{i.see_list}"
  i.select_dish("Pizza", 3)
  puts "verify_order = #{i.verify_order}"
end
