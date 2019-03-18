require 'order'
require 'order'

class Takeaway
  attr_reader :sms, :menu, :order

  def initialize(menu:, order:, sms:)
    @menu = menu
    @order = order
    @sms = sms
end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      @order.add(dish, quantity) 
    end
    sms.deliver
    @order.total
  end

end
