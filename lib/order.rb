require 'menu'
require 'send_sms'

class Order
  def initialize
    @menu = Menu.new
    @total = 0
  end

  def check_total(order = @menu.order)
    order.each { |item|
      @total += item[:price]
    }
    @total
  end

  def send_text(client = Text.new)
    client.send_text
  end
end
