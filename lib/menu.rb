require_relative 'order.rb'

class Menu
  attr_reader :options, :my_order

  def initialize
    @options = { 'katsu wrap' => 4.50, 'tikki masala' => 5.00 }
    @my_order = Order.new(options = @options)
  end

  def add_item (dish, price)
    @options[dish] = price
  end

end
