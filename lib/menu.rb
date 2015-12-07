require_relative 'order.rb'

class Menu
  attr_reader :options, :my_order

  def initialize
    @options = { 'beef-chuck brisket sub' => round(4.5), 'pastrami salami sub' => round(5) }
    @my_order = Order.new(options = @options)
  end

  def add_item (dish, price)
    @options[dish] = price
  end

  private

  def round(num)
    (num*100).round / 100.0
  end

end
