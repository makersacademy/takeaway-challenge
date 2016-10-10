class Message

require 'twilio-ruby'

attr_reader :to, :from, :body, :delivery

  def initialize(to, from, body)
    @to = to
    @from = from
    @body = body

    account_sid = 'ACbae83da0b5b8132dc7c75548b59e6234'
    auth_token = '385138931f39cb4549f0cdce93efbea0'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @delivery = (Time.now + 3600).strftime("%H:%M")
  end

    def send_message
    client.account.messages.create({
      :from => '+441163263729',
      :to => '+447795403523',
      :body => "Your order will be deliverd no later than #{delivery}."
    })
    end
end
