require 'twilio-ruby'

class Checkout

  def initialize (order)
    @order = order






    def place_order payment_amount
      raise 'That is not the correct payment amount!' if payment_amount !=total_price
      print 'Thank you for your order'
      send_text_confirmation
    end

    def send_text_confirmation
