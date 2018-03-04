require 'csv'
require './send_sms.rb'
require './menu'
class Takeaway
  attr_reader :menu, :final_order, :total  
  def initialize
    @menu = Menu.new.menu
    @final_order = []
    @total = 0
  end   

  def order(dish, quantity)
    price = @menu[dish]
    fail "We do not have that dish here" if menu.key?(dish) == false
    order = {}
    order[:dish] = dish
    order[:quantity] = quantity
    @total += price * quantity
    @final_order << order
    @total  
  end   

  def sum_correct?
    sum = 0
    for order in @final_order
      price = @menu[order[:dish]]
      sum += price * order[:quantity]
    end
    sum == @total
  end  
  
  def confirmation
    fail "There was an error in your order" if sum_correct? == false
    Text.new.text_send
  end 
end 
