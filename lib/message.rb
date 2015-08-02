require 'twilio-ruby'

class Callcentre

ACCOUNT_SID = 'AC1304675c82799bf392a923bac1245c51'
AUTH_TOKEN = '49002ffda8620376f48976d4e21c96a0'
DEFAULT_NUMBER = '+441768392059'

attr_accessor :number

  def initialize(number = DEFAULT_NUMBER)
    @number = number
  end

  def send_text(customer_number, message_body)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.account.messages.create({
        :from => '+441768392059',
        :to => customer_number,
        :body => message_body,
    })
  end

end



