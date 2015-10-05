require_relative 'order'
require_relative 'text'

class Customer
  include Menu

  attr_reader :text_provider

  def initialize(text_api=Text.new)
    @text_provider = text_api
  end

  def verify_and_pay(order, total_price)
    if order.order_total(total_price) == true
      self.order_complete
    else
      fail 'Payment failed, please pay correct total.'
    end
  end

  def order_complete
    @text_provider.send_text(text_content)
    'Thank you, payment has been accepted. You will shortly receive a confirmation text message.'
  end

  private

  def time_of_delivery
    (Time.new + 3600).strftime("%H:%M")
  end

  def text_content
    "Thank you! Your order has been placed and will be delivered before #{time_of_delivery}."
  end
end
