require_relative 'delivery.rb'
require_relative 'customer.rb'

class Takeaway

  include Delivery

  def create_bill(customer)
    price = customer.order.inject { |acc, num| acc + num }
    "Your total bill is £#{price}0"
  end

  def confirm_order(customer)
    send_text(customer)
  end

end
