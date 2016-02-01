require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :confirm_order, :receipt

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

  def order_total
    result = @receipt.inject{|sum,x| sum + x }
    result
  end

end