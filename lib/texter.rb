require 'twilio-ruby'

class Texter

  def initialize(client = Twilio::REST::Client)
    @account_sid = 'ACf89596d0fba6c01a7ba140ade7edfefc'
    @auth_token = '5f9eadd286fa95924ddf3a86a02cfd59'
    @client = client.new(@account_sid, @auth_token)
    @from = '+441233800623'
    @to = '+447504848546'
  end

  def send_text(cost)
    time = Time.now
    soon = time + 3600
    @client.messages.create(
      from: @from,
      to: @to,
      body: "You'll get your £#{cost} worth of "\
        "food by #{soon.strftime("%H:%M")}"
    )
  end

end
