require_relative 'order'
require_relative 'inputoutput'
require 'twilio-ruby'

class InputOutput
  def send_text
    @client = Twilio::REST::Client.new 'ACe7d365ffa7e34117145ddfafd390d01d', 'a4dd107057b04723d30b432ee2cd1db8'
    @client.account.messages.create(:body => "Your order is on its way and will be there at #{Time.new.hour + 1}:#{Time.new.min}",
        :to => "+447816139888",
        :from => "441643870037")
  end
end
