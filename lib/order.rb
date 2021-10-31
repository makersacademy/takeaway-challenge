require './lib/menu'

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def add_dish(dish_name, quantity)
    dish_to_add_to_basket = menu.dishes.select { |dish| dish[:name] == dish_name }.reduce(&:merge)
    quantity.times { self.basket << dish_to_add_to_basket }
  end

end


