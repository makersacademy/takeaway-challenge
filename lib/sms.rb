require 'twillio-ruby'

attr_reader :client

class SMS

  account_sid = 'AC1fd02300dfb067e6eed09cb379675665'
  auth_token = 'd3722b469cb0e2caeaafae46d4d97125'

  def initalize(client: nil)
    @client = Twillio::REST::Client.new account_sid, auth_token
  end

  def deliver
    client.messages.create(
    from: '+441163263088',
    to: '+447400230230',
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end


end
