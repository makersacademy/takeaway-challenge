require_relative 'sms'
class Shop
  include Sms

  attr_reader :orders

  def initialize
    @orders = {}
  end

  def take_order(order, customer)
    @orders[(total_orders + 1)] = { order: order, user: customer }
    send(customer.tel, "Your takeaway order will arrive by #{one_hour}")
  end

  def total_orders
    orders.size
  end

  private

  def one_hour
    (Time.now + 3600).strftime "%H:%M"
  end
end
