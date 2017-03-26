require 'rubygems'
require 'twilio-ruby'

module TextMessage

  def send_message

    account_sid = "AC93b586d59c513b473b3baa1496242716"
    auth_token = "b96c6386d7ca307752495434dc2bd9f4"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441431905045" # Your Twilio number



    client.account.messages.create(
    :from => from,
    :to => "+447479866394",
    :body => "You're order is on the way, it should arrive at #{time_plus_one}."
    )
    puts "Message sent!"
  end

  def time_plus_one
    t = Time.now + 60*60
    t.strftime("%I:%M")
  end

end
