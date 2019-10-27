require 'bundler'
Bundler.require()

$account_sid = ENV['TWILIO_ACCOUNT_SID']
$auth_token = ENV['TWILIO_AUTH_TOKEN']




class Sms
  def initialize
    @client= Twilio::REST::Client.new($account_sid, $auth_token)
  end

  def order_placed_message
    @client.messages.create(
      to: ENV['MOBILE_NUM'],
      from: "+12028757975",
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}."
    )
    end

    def order_not_placed
      @client.messages.create(
        to: ENV['MOBILE_NUM'],
        from: "+12028757975",
        body: "Your order could not be placed. Please check payment amount is correct and try again."
      )
      end
end
