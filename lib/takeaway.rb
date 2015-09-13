require_relative 'delivery.rb'
require_relative 'customer.rb'

class Takeaway

  include Delivery

  def create_bill(customer)
    price = customer.order.inject { |acc, num| acc + num }
  end

  def confirm_order(customer)
    send_text(customer)
  end

end

