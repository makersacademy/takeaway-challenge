class Order

  require_relative './menu'

  attr_reader :current_order

  def initialize(numbers)
    @current_order = Menu.new.selection(numbers)
  end

  def total
    @current_order.map { |dish, quantity| dish[1] * quantity }.inject(:+)
  end

end
