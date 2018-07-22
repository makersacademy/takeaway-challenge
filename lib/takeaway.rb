require 'order'

class Takeaway
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.show
  end

  def place_order(whiskies)
    whiskies.each do |item, quantity|
      order.add(item, quantity)
    end
  end
  
  private

  attr_reader :menu, :order
end
