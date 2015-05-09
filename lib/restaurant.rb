require_relative 'customer'

class Restaurant

  attr_accessor :dishes

  def initialize
    @dishes = { :Rice => 1.50, :Naan => 2.00, :Vindaloo => 5.00 }
  end

  def place_order(customer)
    fail 'Nothing ordered yet' if customer.order.empty?
    customer.current_order
    require './send_sms.rb'
  end

end