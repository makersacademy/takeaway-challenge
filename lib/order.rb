require_relative 'menu'
class Order

  attr_reader :current_order

  def initialize(food)
    @food = food
    total_up(food)
  end

  def total_up(food)
    @current_order = 0
    food.each { |item| @current_order = @current_order + Menu.new.menu[item] }
    @current_order
  end

  def complete
    "Order complete! Your order of #{@food.join(", ")} will arrive before #{Time.now + (60 * 60)}"
  end

end
