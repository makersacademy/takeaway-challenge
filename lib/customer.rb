require_relative 'takeaway'
require_relative 'confirm'

class Order 

attr_reader :basket, :takeaway, :total

  def initialize(takeaway = Takeaway) 
    @basket = []
    @takeaway = takeaway.new
    @text = Text.new
    @selection = {}
    @total = 0
  end 

  def view
    @takeaway.view
  end 

  def select_dish(dish, quantity, price)
    @selection[dish] = quantity
    sum_total(quantity, price)
    add_to_basket
    @selection = nil
  end

  def add_to_basket
    @basket << @selection
  end 

  def sum_total(quantity, price)
    @total += (quantity * price)
  end 

  def place_order
    fail "Nothing in basket" if @basket == []
    @text.sms
  end 
 

end 