require 'order'

describe Order do
  
end

class Start
  attr_reader :order

  def initialize(order - Order.new)
    @order = order
  end

  def self.start
    order = Order.new
    order.menu.display_menu
    puts "\nWhat would you like to order?"
  end
end