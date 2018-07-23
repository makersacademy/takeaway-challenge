require 'order'

class Takeaway
  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new # experimenting with dependency injection
    @sms = sms
  end

  def show_menu
    menu.show
  end

  def place_order(whiskies)
    whiskies.each do |item, quantity|
      order.add(item, quantity)
    end
    order.total
  end
  
  private

  attr_reader :menu, :order
end
