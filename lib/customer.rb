require_relative 'restaurant'

class Customer

  attr_reader :order, :bill_conflict
  def initialize
    @order = nil
  end

  def view_menu
    Restaurant.new.format_menu
  end

  def make_order(order_as_hash)
    #user inputs {"item" => quantity}
    @order = order_as_hash
  end

  def validate_bill(bill_total)
    my_total = 0
    @order.each{|key, value|
      my_total += @order[key] * Restaurant.new.menu[key]
    }
    fail('bill incorrect') if my_total != bill_total
    my_total
  end

  # def check_for_objection(my_t, bill_t)
  #   if my_t != bill_t
  #     @bill_conflict = true
  #     raise_error('bill incorrect')
  #   else
  #     @bill_conflict = false
  #   end
  # end

end
