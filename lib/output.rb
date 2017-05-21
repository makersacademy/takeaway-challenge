require_relative 'order'
require 'twilio-ruby'


class Output
  def send_text
    @client = Twilio::REST::Client.new ENV['AUTH'], ENV['PID']
    @client.account.messages.create(:body => "Your order is on its way and will be there at #{Time.new.hour + 1}:#{Time.new.min}",
        :to => ENV['PHONE'],
        :from => "441643870037")
  end
end
