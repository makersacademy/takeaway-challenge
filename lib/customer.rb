require_relative 'restaurant'

class Customer

  attr_reader :order

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

end
