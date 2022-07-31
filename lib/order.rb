require './lib/menu'

class Order

  attr_reader :basket, :menu, :total

  def initialize
    @basket = []
    @menu = Menu.new
    @total = 0
  end

  def add_dish(dish_name, quantity)
    dish_to_add_to_basket = menu.dishes.select { |dish| dish[:name] == dish_name }.reduce(&:merge)
    quantity.times { @basket << dish_to_add_to_basket }
  end

  def display_basket
    @basket.each { |dish| puts "#{dish[:name]} - £#{dish[:price]}" }.reduce(&:merge)
  end

  def total_cost
    @basket.each { |dish| @total += dish[:price] }
    "Total cost £#{@total}"
  end

end
