require 'twilio-ruby'

class Message

  def initialize
    @client = Twilio::REST::Client.new('AC14e27209a84417b0316b7500d55f08d0', '4a6354fb726edc02c1a275511cfef459')
    @delivery_time = (Time.new + 60*60).strftime("%H:%M")
  end

  def send
    @client.account.messages.create(text_info)
  end

  def text_info
    {
      :from => '+441133206366',
      :to => '+447721140857',
      :body => "Thank you! Your order was placed and will be delivered before #{@delivery_time}",
      }
  end

end
