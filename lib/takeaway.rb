# build order
# read available options
# compare total
# submit order

require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class TakeAway

  attr_reader :menu, :new_order, :sms_message, :total, :basket

def initialize(menu = Menu.new)
  @menu = menu
  @new_order = Order.new(menu)
  @basket = []
end

  def show_menu
    menu.dishes.each { |key, value| puts "#{key}.........£#{value}" }
  end

  def add(dish, quantity=1)
    self.new_order.add(dish, quantity)
    basket << [dish, quantity]
    "#{quantity}x #{dish} added to your basket"
  end

  def checkout(total)
    if price_match?(total)
      send_confirmation("Thank you for your order, Total: £#{total}")
      "Thank you for your order, Total: £#{total}"
    else
      "Price doesn't match total"
    end
  end




  #TODO currently in test
  # Twilo api
  def send_confirmation(message)
    @sms_message = SMS.new
    sms_message.send_sms(message)
  end


  private

  attr_writer :menu, :new_order

  def price_match?(total)
    total.to_f == self.new_order.total_price
  end

end
