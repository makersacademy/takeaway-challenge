require_relative 'order'
require_relative 'menu'

class Restaurant
  attr_reader :menu, :order, :final_bill   #:text_messager still to be added

  def initialize(menu, order) #text_messager
    @menu = menu
    @order = order
    # @text_messager = text_messager
  end

  def total
    @final_bill = order.total_bill(menu)
    @final_bill
  end


  def finalise
    fail "Error: sum of dishes in order does not match total bill!" if !correct_amount?
    "SMS sent"
  end

  def correct_amount?(amount)
    amount == @final_bill.gsub(/[^0-9]/,'').to_i
  end

end
