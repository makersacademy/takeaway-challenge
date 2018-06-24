require_relative './dishes_list.rb'
require_relative './dish.rb'
require_relative './calculate_order.rb'
require_relative './twilio_sms.rb'

class Order

  attr_reader :dishes_list, :calc, :takeaway_order, :balance, :order_complete,
  :twilio

  def initialize
    @dishes_list = DishesList.new
    @calc = CalculateOrder.new
    @twilio = TwilioSMS.new
    @takeaway_order = []
    @balance = 0
    @order_complete = false
  end

  def view_list
    dishes_list.view_list
  end

  def add_order(dish)
    @takeaway_order << dish
    @balance += dish[:price]
    @order_complete = false
    "Dish added. Your order total: #{balance}"
  end

  def complete_order
    calculate_balance
    check_balance
    fail "balance does not match: check order" unless balance_match?
    fail "your order is empty: add some dishes first" if order_empty?
    @order_complete = true
    send_sms
  end

  def check_balance
    balance_match?
  end

  private

#  this method checks the order balance match the sum of the order
  def calculate_balance
    @calc.calculate(@takeaway_order)
  end

  def balance_match?
    @calc.compare(@balance)
  end

  def order_empty?
    takeaway_order.length.zero?
  end

  def order_complete?
    @order_complete
  end

  def send_sms
    @twilio.send_sms
  end

end
