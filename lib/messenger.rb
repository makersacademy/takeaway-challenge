class Messenger

  def initialize client
    setup_twilio client
  end

  def send_sms message
    create_sms message
  end

  private

  def setup_twilio twilio_client
    @client = twilio_client.new ENV['TWISID'] , ENV['TWITOK']
    @sender = ENV['SENDER']
    @receiver = ENV['RECEIVER']
  end

  def create_sms message
    @client.account.messages.create(
      from: @sender,
      to: @receiver,
      body: message
    )
  end

end
