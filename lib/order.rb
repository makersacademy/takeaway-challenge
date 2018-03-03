require_relative 'menu.rb'

class Order
  def read_menu(menu)
    puts menu.format
  end

  def add_dish(number, quantity = 1)
    @basket = {}
    @basket[(Menu.new.dishes[number]).first] = [Menu.new.dishes[number].last, quantity]
    @basket
  end
end
