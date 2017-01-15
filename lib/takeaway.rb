require_relative 'order'
require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Takeaway

  attr_reader :order

  def initialize(order_session)
    @order = order_session.new(Menu)
  end
  
end
