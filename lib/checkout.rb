require_relative 'send_sms'
require_relative 'pretty_format'

class Checkout

  include Sms
  include PrettyFormat

  def initialize(basket, total)
    @basket = basket
    @total = total
    confirmation
  end

  def confirmation
    puts "\nThank you for your order!\n\nORDER DETAILS:\n"
    pretty_format(@basket, @total)
    puts "You should receive an SMS message shortly confirming your order\n\n"
    get_sms_details
  end

end
