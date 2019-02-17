require 'twilio-ruby'

class Text

  @account_sid = "AC436e6f2512545447559a7e2acec8acf5"
  @auth_token = "b122cff226597aba1477cbc7e1c0ab1a"

  def initialize(client = nil)
    @client = client || Twilio::REST::Client.new @account_sid, @auth_token
  end

  def deliver
    client.messages.create
  end

  def create
    body: "Thank you! Your order was placed and will be delivered before 18:52.",
    to: "+447535866628",
    from: "+441547220145"
  end

  def del_time
    (Time.now + 60*60)
  end

# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
  # body: "Thank you! Your order was placed and will be delivered before 18:52.",
  # to: "+447535866628",
  # from: "+441547220145")

  # puts message.sid
end
