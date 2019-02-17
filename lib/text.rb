require 'twilio-ruby'

class Text

  @account_sid = "AC436e6f2512545447559a7e2acec8acf5"
  @auth_token = "b122cff226597aba1477cbc7e1c0ab1a"

  def initialize(client_class = Client)
    client = client_class.new(account_sid = @account_sid, auth_token = @auth_token)
    @client = client || ::Twilio::REST::client.new(account_sid, auth_token)
  end

  def deliver
    delivered_message = @client.messages.create
  end

  def create
    {
    from: "+441547220145",
    to: "+447903616384",
    body: "Thank you! Your order was placed and will be delivered before 18:52."
    }
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
