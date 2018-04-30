require 'twilio-ruby'

class Messager
  def initialize
    account_sid = "AC8ea5e161886bad3eadb46f11344fdb78"
    auth_token = "eaf5d9cbaecd26b33db098ece6db1c4c"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  private

  def send_text
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{calculate_time}",
      to: "+447453670847",
      from: "+441183246310")
  end

    def calculate_time
      t = Time.now + 3600
      "#{t.hour}:#{t.min}"
    end
end
