require_relative 'menu'
require_relative 'restaurant'

class Order

attr_reader :basket, :total

def initialize(restaurant = Restaurant.new)
  @restaurant = restaurant
  @basket = Hash.new(0)
  @total = 0
end

def check_menu
  @restaurant.menu.check
end

def add_item(dish, quantity = 1)
  chosen_dish = @restaurant.menu.select_by_name(dish)
  @basket[chosen_dish] += quantity
end

def remove_item(dish, quantity = 1)
  chosen_dish = @restaurant.menu.select_by_name(dish)
  @basket[chosen_dish] -= quantity
end

def check_basket
  @basket
end

def checkout(total)
  fail 'you put the wrong total in!' if total != calculate_total
  @restaurant.confirm_order(total)
end



def calculate_total
    @basket.each { |item, quantity| @total += (item.price * quantity) }
    @total
end

end
