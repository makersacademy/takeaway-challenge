require 'twilio-ruby'
require 'date'

class Messager

  def send_text
    account_sid = "ACc640aebc9ed667fe38f3481bab876368"
    auth_token = "134e02cb4127679d53aaed26bd40af7d"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441702806346" # Your Twilio number

    friends = {
      "+4407767831356" => "Valentina"
    }
    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Thank you! Your order was placed and will be delivered before #{DateTime.now + (1/24.0)}"
        )
      puts "Sent message to #{value}"
    end
  end

end