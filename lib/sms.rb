require 'twilio-ruby'

class SMS

  attr_reader :client

  def initialize(account_sid, auth_token, from_num, to_num)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from_num = from_num
    @to_num = to_num
  end

  def send
    @client.messages.create(from: @from_num, to: @to_num,
    body: "Thank you for ordering with Jasiveroo!"\
    " Your order was placed and will be delivered before #{Time.now + 1 * 60 * 60}"
    ) 
  end

  private

  attr_reader :from_num, :to_num
end
