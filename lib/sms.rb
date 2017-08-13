# require 'twilio-ruby'

SID = ''
TOKEN = ''

class SMS

  def send(phone_number, summary)
    create(phone_number, summary)
  end

  private

  def create(phone_number, summary)
    sms = "Thank you! Your order was placed and will be delivered before #{summary[:time]}"
    out = "A confirmation has been sent to #{phone_number}"
    # Twilio::REST::Client.new(SID, TOKEN).account.messages.create({
    #   :from => '+15017250604',
    #   :to => phone_number,
    #   :body => sms,
    # })
    puts "#{sms}\n#{out}"
  end
end
