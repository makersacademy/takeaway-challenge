class Message

  require 'twilio-ruby'

  attr_reader :to, :from, :body, :delivery

  def initialize(from, to, body)
    @from = from
    @to = to
    @body = body

    account_sid = 'ACff548a8c123da03c1873dc2f6c545186'
    auth_token = '84d305bf3cf531e786efcbd422c457f6'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @delivery = (Time.now + 3600).strftime("%H:%M")
  end

    def send_message
    client.account.messages.create({
      :from => '+441143032624',
      :to => '07852922847',
      :body => "Thank you for your order; it will be delivered to you " +
      "no later than #{delivery}."
    })
    end

end
