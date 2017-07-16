require 'twilio-ruby'

class SmsConfirmation
  # TWILIO_NUMBER = +441593362030
  # ACCOUNT_SID = "AC3b066280d449a579213156a86ef3070f"
  # AUTH_TOKEN = 'ea53f57ecc0c88a3468168abbc37e452'
  #
  # @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  # @customer_number = +441234567890
  #
  # def send_message
  #   @client.messages.create({
  #   :from => TWILIO_NUMBER,
  #   :to => @customer_number,
  #   :body => "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  #   })
  # end
  #
  # def delivery_time
  #   Time.now + 3600
  # end

  def send_text(message)
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).messages.create(
          from: ENV['TWILIO_PHONE'],
          to: ENV['TWILIO_TO'],
          body: message
        )
  end
end
