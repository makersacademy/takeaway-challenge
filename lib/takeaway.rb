require_relative 'menu'
require_relative 'send_sms'

class Takeaway

NO_ITEM_MESSAGE = "Item not on menu"
attr_reader :basket, :menu
  def initialize(menu = Menu.new, message = Sendsms.new)
    @menu = menu
    @basket = []
    @message = message
  end

  def order_food(food, quantity = 1)
    @menu.contains_item?(food) ? add_to_basket(food, quantity) : NO_ITEM_MESSAGE
  end
   
  def menu
    @menu.menu
  end 


 def total_cost
   cost = 0
   @basket.each { |food| cost += @menu.menu[food[:food]] * food[:quantity] }
   cost
 end 

  

  def checkout(value)
    raise "Incorrect total" if !is_correct_cost?(value)
    @message.send_message("Thank you! Your order was placed and will be delivered within 1 hour")
  end

  private

  def add_to_basket(food, quantity)
      @basket << {:food => food.to_sym, :quantity => quantity}
  end

  def is_correct_cost?(price)
    total_cost == price
  end
end
