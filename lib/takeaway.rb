# require_relative 'twilio'

class Takeaway

  attr_accessor :list, :order, :amount_due, :confirmation

  def initialize
    @list = {'red curry' => 5, 'green curry' => 5}
    @order = []
    @amount_due = 0
    @confirmation = ""
  end

  def register_order (item)
    order << item
    calculate_order
  end

  def calculate_order
    fail 'no order placed' if empty?
    @amount_due = order.map {|x| x.values}.flatten(1).inject(:+)
    set_confirmation
  end

  def set_confirmation

   @confirmation =  "Thank you! Your order was placed and will be delivered before #{(Time.new.hour) +1}:#{(Time.new).min}. The amount due is #{amount_due}$."
  end

  def empty?
    order.empty?
  end

end







