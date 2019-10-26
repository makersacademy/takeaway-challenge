class Message

  # require 'twilio-ruby'
  #
  # TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']    #add your own
  # TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']      # details
  # TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  # MY_NUMBER = ENV['MY_NUMBER']
  # @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
  #
  # def send(customer_telephone_number, client = CLIENT)
  #   current_time = Time.now
  #   delivery_time = Time.now + 3600
  #   client.messages.create(
  #     :from => TWILIO_NUMBER,
  #     :to => customer_telephone_number,
  #     :body => "Thank you! Your order was placed at #{current_time.hour}:#{current_time.min} and will be delivered by #{delivery_time.hour}:#{delivery_time.min}"
  #   )
  # end

  # def delivery_time
  #   one_hour = 3600
  #   current_time = Time.now + one_hour
  # end
  #
  # def send_message(text)
  #   @messenger.create_message(text)
  #   text
  # end
end
