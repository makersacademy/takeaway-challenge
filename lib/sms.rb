require "twilio-ruby"

class SMS

  TIME = "%H:%M"

  attr_reader :client, :config, :messages

  def initiliaze(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def delivered
    client.messages.create({from: config[:from], to: config[:to], body: config[:body] % delivery_time})
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME)
  end

end
