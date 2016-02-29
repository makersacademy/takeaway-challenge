require 'twilio-ruby'
require 'sms'

class Takeaway

  attr_reader :menu, :confirm_order, :receipt, :total

  def initialize
    @menu = {"Burger"=>10, "Shake"=>5, "Fries"=>5, "Hot Dog"=>4, "Root Beer Float"=>0}  
    @confirm_order = []
    @receipt = []
  end

  def order(each_dish, quantity)
    quantity.times do
      @confirm_order << each_dish
      @receipt << @menu[each_dish]
    end
  end

  def order_total(amount)
    result = receipt.reduce { |sum, price| sum + price }
    @total = true if amount == result
  end

  def confirmed_order(amount)
    order_total(amount)
    send_confirmation_text if correct?
  end

  def send_confirmation_text
    SMS.send_text("Thank you for your order! Your total is #{order_total}")
  end

  def correct?
    !!@total
  end
end