require 'twilio-ruby'
require_relative 'sms'
require_relative 'takeaway'

class Order
  attr_reader :receipt, :menu

  def initialize
    @menu = Takeaway.new
    @receipt = []
  end

  def select_dish(dish, quantity)
    quantity.times { @receipt << @menu.menu[dish.to_sym] }
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def total
    "Total: £#{@receipt.sum}"
  end

  def checkout
    Sms.new.send_sms
  end
end
