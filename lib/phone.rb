require 'twilio-ruby'

class Phone 

  ACCOUNT_SID = 'AC04dfcfa3b1f088665f3a27c100f53232'
  AUTH_TOKEN = '51d1106c4cb965936d156820537c712f'

  def initialize(takeaway_number, message)
  	@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  	@takeaway_number = takeaway_number
  	@message = message
  end

  def send_confirmation(customer_number)
  	@client.messages.create(
  	from: @takeaway_number,
  	to: customer_number,
  	body: @message)
  end

end
