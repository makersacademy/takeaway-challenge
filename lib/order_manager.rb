# Manage the orders of the customer

class OrderManager

  attr_reader :inventory
  attr_accessor :order


def initialize(inventory)
  @inventory = inventory
  @text_manager = SMSSender.new
  @current_order
end

def submit_order(order,payment)
  raise "This total is not correct" if !is_payment_correct?(order,payment)
  # send_sms
  true
end

def create_order(order = Order)
  order.new
end

def is_payment_correct?(order,payment)
  true
end

def send_sms
end


def is_order_in_stock?
end


end
