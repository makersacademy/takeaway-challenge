require 'csv'
require './lib/send_sms.rb'
class Takeaway
  attr_reader :menu, :sum_of_order, :final_order  
  def initialize
   @menu = CSV.read('/Users/chiakimizuta/gitDir/takeaway-challenge/lib/menu.csv', col_sep: ',', converters: :numeric)
   @final_order = []
   @sum_of_order = 0
  end   

  def order(dish, quantity)
    order = {}
    quantity = 0
    order[:dish] = dish
    order[:quantity] = quantity
    @sum_of_order += quantity
    @final_order << order     
  end   
  
  #raise error if dish isnt in the menu
  #make a hash {dish:price}, quantity
  #let total amount of price be same as calculation


  def sum_correct?
    sum = 0
    for order in @final_order
      order.each do |dish, quantity|
        sum += quantity
      end
    end
    sum == @sum_of_order
  end  
  
  def confirmation
    fail "There was an error in your order" if sum_correct? == false
    text.text_send
  end

  def text
    Text.new
  end           
end 
