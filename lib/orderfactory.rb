require './lib/order'
require './lib/invoice'
require './twilio'

class OrderFactory
  def self.load(menu)
    Order.new(menu,Invoice,TwilioClass)
  end
end
