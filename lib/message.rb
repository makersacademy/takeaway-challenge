require 'twilio-ruby'

class Message

  ACCT_SID = "AC175ffc1e7a9117a7fce465205f64f4e9"
  AUTH_TOKEN = "f60ac2e885546d154b7d50867b3c8f4d"

  attr_reader :to, :from

  def initialize(to = '+447403123456', from = '+441202286041')
    @to = to
    @from = from
    @client = Twilio::REST::Client.new ACCT_SID, AUTH_TOKEN
  end

  def send_message
    message = @client.account.messages.create(
        :body => "Thankyou for placing your order. Your food will be with you by #{(Time.new + 60*60).strftime("%R")}.",
        :to => @to,
        :from => @from)

    puts message.sid
  end

end
