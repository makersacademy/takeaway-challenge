require 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.show
  end

  def place_order(options)
    options.each do |option, quantity|
      order.add(option, quantity)
    end
    order.total
  end

  
end
