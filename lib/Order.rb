require_relative 'menu'
require_relative 'sms'
  
class Order
    
  include Restaurant

  attr_accessor :dishes, :order_list

  def initialize(menu = Menu.new, sms = Twilio::REST::Client.new)
    @menu = menu
    @sms = sms
    @order_list = []
  end

  def print_menu
    @menu.to_s
  end

  def add(dish, quantity)
    @menu.dishes.each do |item| 
    @order_list << {name: dish, quantity: quantity, price_each: item[1]} if item[0] == dish 
    end
  end

  def total
   @total_price = @order_list.map do |item| 
    item[:quantity] * item[:price_each] 
    end.reduce(:+)
  end  

  def complete_order
    @sms.send("Thank you! Your order was placed and will be delivered before: #{(Time.now + 2500).strftime("%k:%M")}.")
  end

  def sum_ok?(total)
    @total_price == total ? true : (raise 'No can do')
  end

end
