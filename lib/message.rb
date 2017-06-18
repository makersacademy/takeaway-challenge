require 'twilio-ruby'

class Message

  ACCT_SID = "ACb644f39cef1e22edc5ce2c39d22f5992"
  AUTH_TOKEN = "eaf80a331ab15d786fc005593a703922"

  attr_reader :to, :from

  def initialize(to = '+447445568685', from = '+441668932046')
    @to = to
    @from = from
    @client = Twilio::REST::Client.new ACCT_SID, AUTH_TOKEN
  end

  def send_message
    message = @client.account.messages.create(
        :body => "Thank you for placing your order. Your food will be with you by #{(Time.new + 60 * 60).strftime("%R")}.",
        :to => @to,
        :from => @from)

    puts message.sid
  end
end
