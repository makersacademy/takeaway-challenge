require 'twilio-ruby'

class Texter
  def send_message
    client = Twilio::REST::Client.new('AC22e404afa7c85c5bf71bd87b237dffb9', '66284fec61bc12c45b7ba7aeaf36f142')
    client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before { #{(Time.new+(3600)).strftime("%I:%M%p")}}",
        :to => "+447771225759",
        :from => "+441158242731")
  end
end
