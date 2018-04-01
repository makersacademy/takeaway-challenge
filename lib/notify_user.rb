require 'twilio-ruby'
class NotifyUser
  ACCOUNT_SID = ENV['AC_SID']
  AUTH_TOKEN = ENV['TWIL_TOKEN']

  def self.send_notification
     delivery_time
     create_client
     send_message
  end

  private
  def self.delivery_time
    t = Time.now + 60 * 60
    @time = "#{t.strftime("%H:%M")}"
  end

  def self.create_client
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def self.send_message
    @client.messages.create(
      body: "Your order has been placed and will be " +
      "delievered before #{@time}",
      to: ENV['MY_NUMBER'],
      from: ENV['TWILIO_NUMBER'])
  end
end
