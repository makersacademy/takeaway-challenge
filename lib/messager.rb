require 'twilio-ruby'

class SMS

  TIME_FORMAT = "%H:%M"

def initialize(config, client: nil)
  @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  @config = config
end

  def deliver

    client.messages.create(message_args)
    #account_sid = "AC16019d9121d703a7d9d74682521dd5d2" # Your Account SID from www.twilio.com/console
    #auth_token = "7a57357395822bfd714d22f01b16f780"   # Your Auth Token from www.twilio.com/console
  #     @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  #     message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{delivery_time}",
  #         from: ENV['TWILIO_PHONE'],
  #         to: ENV['TWILIO_DESTINATION_PHONE']
  #     puts e.message
  # end

  # def delivery_time
  #       time = (Time.new + 1*60*60).asctime
  #       hour_and_min = time[11,5]
  # end


  end

  private
  attr_reader :client, :config

    def message_args
      {
        from: config[:from],
        to: config[:to],
        body: config[:body] % delivery_time
      }
    end

    def delivery_time
      (Time.now + 60 * 60).strftime(TIME_FORMAT)
    end

end
