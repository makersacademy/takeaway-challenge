require 'twilio-ruby'

class Receipt

  attr_reader :receipt 

  def initialize
    @receipt = []
  end

#   def receipt
#     @receipt
#   end

end

# receipt = Receipt.new
# receipt.send_sms