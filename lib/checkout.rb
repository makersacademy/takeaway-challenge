require_relative 'order'
require_relative 'till'

class Checkout

  include Till

  attr_reader :order

  def initialize order
    @order = order
  end

  def no_dishes_ordered?
    @order.dishes.empty?
  end

  def send_msg
    if no_dishes_ordered?
      fail 'No dishes have been added to the order'
    else
      require_relative 'twilio.rb'
    end
  end

end