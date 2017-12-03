require 'twilio-ruby'

class Takeaway
  attr_reader :menu, :bill

  def initialize
    @menu = Menu.new
    @bill = bill
    @total_order = {}
  end

  def menu
    @menu.print_menu
  end

  def place_order(order)
    @total_order = order.basket
  end

  def calculate_total
    @bill = calculate(@total_order)
  end

  def verify_order(order)
    @bill == order.current_value
  end

  def calculate(total_order)
    @total_order.values.map {|each_order| each_order.inject(:*)}.map.inject(:+)
  end

end
