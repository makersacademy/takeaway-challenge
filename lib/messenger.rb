require 'twilio-ruby'

class Messenger
  
  def initialize
    @client = Twilio::REST::Client.new('ACf630b9f6345f5dd86bfb1705041c59fe', '409a60d7be1227c7598832a89d0a32d2')
  end
  
  def send_text
    @client.account.messages.create({
      :from => '+441143031215',
      :to => '+447929842337',
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    })
    puts "Sent message to somebody out there"
  end
  
  def delivery_time
    (Time.now + 60*30).strftime("%H:%M")
  end

end

