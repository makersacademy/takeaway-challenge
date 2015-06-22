require 'twilio-ruby'
class Takeaway

  # def initialize
  # 	@foods = { Noodles: 3.00, Rice: 2.50 }
  # end
  def send_text(m)
    time_due = Time.new + 3600
    h = time_due.hour
    m = time_due.min

    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    message = @client.account.messages.create(:body => "Your order has been placed and will arrive by #{h}:#{m}",
	    :to => "+447921262696",
	    :from => "+441322721370")
  end
end