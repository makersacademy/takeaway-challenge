require 'twilio-ruby'

class SMS

  def initialize(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
    # @client = client || Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV["TWILIO_AUTH_TOKEN"])
  end

  def send
    @client.account.messages.create(message_args)
  end

    # @client.account.messages.create(
    #   from: ENV['TWILIO_PHONE'],
    #   to: ENV['TWILIO_DESTINATION_PHONE'],
    #   body: "Thank you! Your order was placed and will \
    #   be delivered before #{delivery_time}."
    # )

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
    (Time.now + 3600).strftime('%H:%M')
  end

end
