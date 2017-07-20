# this class contains an order of dishes chosen from the menu
require_relative 'menu'
require_relative 'msg_sender'

class Order

  attr_reader :current_order, :total_price, :calculated_price

  def initialize(new_order)
    @current_order = new_order
  end

  def process_order
    confirm_order
    print_order
    create_text
  end

  def confirm_order
    total_price_calculation
    price_check
    raise "The total amount is not correct, please order again." if total_price != calculated_price
    puts "Order confirmed!"
  end

  def print_order
    print_result = "Summary of your order: "
    current_order.each { |item| print_result << "#{item[:dish]} #{item[:quantity]}x, " }
    total_price_calculation
    print_result << "total price £#{total_price}"
    puts print_result
  end

  def total_price_calculation
    sum = 0
    current_order.each { |item| sum += item[:price] }
    @total_price = sum
  end

  def price_check
    ary = []
    current_order.each { |item| ary << item[:price] }
    @calculated_price = ary.inject(0, :+)
  end

  def create_text(text_class = MsgSender)
    text_class.new
  end

end
