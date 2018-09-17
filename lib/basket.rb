require_relative 'takeaway'
require_relative 'confirmation'
class Basket

  attr_reader :order, :sum_total, :new_order
  
  def initialize(new_order = CustOrder.new, text = ConfirmText.new)
    @new_order = new_order
    @text = text
    @order = []
    @sum_total = 0
  end

  def select_dish(platter)
    @new_order.dishlection(platter).each do |item|
      @order << item
      @sum_total += item[:price]
    end
  end

  def order_list
    @order.select do |items|
      puts "#{items[:dish]}: £#{items[:price]}"
    end
    order
  end

  def bill
    @sum_total
  end

  def complete_order
    @text.send_text
  end

end
