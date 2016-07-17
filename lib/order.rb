require_relative 'menu'
class Order

  attr_reader :current_order

  def initialize(food)
    @current_order = 0
    food.each { |item| @current_order = @current_order + Menu.new.menu[item] }
    @current_order
  end

end
