class Text

  def initialize
    @time = Time.new
    @hour = (@time.strftime("%k").to_i + 1).to_s
  end
  
  def send_text
    require 'twilio-ruby'
    account_sid = 'AC5a0933cfcc02ee13790862a55c60c227'
    auth_token = ENV["pusher_api_key"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '+44 7481 339235' # Your Twilio number
    to = ENV["pusher_my_mobile"] # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered by #{@hour}:#{@time.strftime("%M")}"
    )
  end

end