require 'rubygems'
require 'twilio-ruby'

class Delivery

  attr_reader :time

  def initialize
    @time = Time.now + 60*60
  end

  def process_text
    eta = Time.now + 60*60
    account_sid = 'ACf2a3374e74c0a52db1d166ffdcd5111d'
    auth_token = '7d29cd76d7a3051f0c46bf04c43d36da'

    @client = Twilio::REST::Client.new account_sid, auth_token

    from = '+441233800268'

    message = @client.account.messages.create(
    :from => from,
    :to => '+447446868867',
    :body => "Thank you! Your order was placed and will be delivered before #{eta}."
    )
    "Thank you! Your order was placed and will be delivered before #{eta}."
  end

end
