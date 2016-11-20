require 'rubygems'
require 'twilio-ruby'

class Sms

  def text
    delivery_time = Time.now + (60 * 60)

    account_sid = "AC3cfdffd043d2ad9ad31516f46690499e"
    auth_token = "bb85005e7205713451e05fe49588764f"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441772441327"

    customers = {"+447588686168" => "Me"}


      customers.each do |number, name|
        client.account.messages.create(
          :from => from,
          :to => number,
          :body => "Thanks for placing your order! Your food will be here before #{delivery_time.strftime('%H:%M')}.")
      end
  end
end
