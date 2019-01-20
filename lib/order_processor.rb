require_relative 'list_of_dishes'
require_relative 'send_sms'

class OrderProcessor

  attr_reader :list_of_dishes, :orders, :number_of_orders, :overall_price, :sms_message_sender

  def initialize(list_of_dishes = ListOfDishes.new)
    @list_of_dishes = list_of_dishes
    @orders = {}
    @number_of_orders = 0
    @overall_price = 0
    @sms_message_sender = SMSMessage.new
  end

  def add_order(order_number, quantity)
    if @orders.key?(order_number.to_s.to_sym)
      @orders[order_number.to_s.to_sym] += quantity
    else
      @orders[order_number.to_s.to_sym] = quantity
    end
    @number_of_orders += quantity
    @overall_price += @list_of_dishes.menu[order_number.to_s.to_i - 1].price * quantity
  end

  def reset_order_processor
    @orders = {}
    @number_of_orders = 0
    @overall_price = 0
  end

  def execute_order(check_order, check_price)
    raise "Incorrect order!" if (check_order != @number_of_orders) || (check_price.to_f.round(2) != @overall_price)
    @sms_message_sender.send_sms_message(@number_of_orders, @overall_price)
    reset_order_processor
  end

end
