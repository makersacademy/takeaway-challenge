require 'twilio-ruby'

class Text

  def initialize(details, client = nil)
    #details passed in as a hash with sid, auth, from and to
    @client = client || Twilio::REST::Client.new[@details[:account_sid], @details[:auth_token]]
    @details = details
  end

  def send_message
    @client.messages.create(body)
  end

  def time
    @time = Time.now
  end

  private

  attr_reader :config, :client

  def body
    {from: @details[:from],
    to: @details[:to],
    body: "Your order will be with at #{delivery_time}" }
  end

  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end
end
