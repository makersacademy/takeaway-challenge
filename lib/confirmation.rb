require 'twilio-ruby'

class Confirmation

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def complete_order
    send_text(get_time)
  end

  private

  def send_text(time)
    # put your own credentials here
  account_sid = '*******************************'
  auth_token = '*******************************'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => '+**************',
    :to => '+**************',
    :body => "Thank you! Your order was placed and will be delivered before #{time}",
  })
  end

  def get_time
    @time = Time.now + 3600
  end

end
