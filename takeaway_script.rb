require './lib/takeaway.rb'
require './lib/dish.rb'

takeaway = Takeaway.new

pizza = Dish.new(5, 'pizza')
steak = Dish.new(8, 'steak')
fish_and_chips = Dish.new(4, 'fish and chips')
fried_chicken = Dish.new(6, 'fried chicken')
caesar_salad = Dish.new(3, 'caesar salad')
pasta = Dish.new(4, 'pasta')

@dishes_available = [pizza, steak, fish_and_chips, fried_chicken, caesar_salad, pasta]

def auto_menu_update(takeaway)
  @dishes_available.each do |dish|
    takeaway.menu_update(dish)
  end
end

auto_menu_update(takeaway)

takeaway.order