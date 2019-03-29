require 'menu'
require 'send_sms'

class Order
  def initialize
    @menu_instance = Menu.new
    @total = 0
  end

  def check_total(order = @menu_instance.order)
    order.each { |item|
      @total += item[:price]
    }
    @total
  end

  def send_text(sms = client)
    sms.messages.create
  end
end
