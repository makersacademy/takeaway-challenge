require 'twilio-ruby'

class MessageSystem

  def send
    send_message
    message_body
  end

  private

  FROM = '+441633530104'
  TO = '+447743106866'
  AUTH_TOKEN = 'hidden'
  ACCOUNT_SID = 'AC85db5da11236557f067ad88f4dafdbda'

  def message_body
    "Thank you!"\
    " Your order was placed and will be delivered before #{one_hour_time}"
  end

   def send_message
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.account.messages.create({
      from:FROM,
      to:TO,
      body:message_body })
    end

     def one_hour_time
       one_hour = Time.now + 60*60
       one_hour.localtime.strftime("%H:%M")
     end
end
