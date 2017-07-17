require_relative 'menu'
require_relative 'two_dp'

class Order

  include TwoDp

  attr_reader :current_order

  def initialize(numbers)
    @current_order = Menu.new.selection(numbers)
  end

  def total
    two_dp(@current_order.map { |dish, quantity| dish[1] * quantity }.inject(:+))
  end

  def breakdown
    @current_order.each { |dish, quantity| puts "#{quantity}x #{dish[0]} @ £#{two_dp(dish[1])} each = £#{two_dp(dish[1] * quantity)}" }
  end

end
