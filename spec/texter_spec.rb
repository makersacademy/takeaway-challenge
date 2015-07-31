require 'texter'
require 'twilio-ruby'

describe Texter do

  let(:client) do
    Twilio::REST::Client.new ENV['SID'], ENV['AUTH_TOKEN']
  end

  xit "sends a text to the user" do
    time = Time.new
    dtime = time + 3600
    delivery_time = dtime.strftime("%I:%M%p")
    Texter.call
    expect(client).to receive :messages #(message: "Thanks for ordering! Your meal will be delivered to you by #{delivery_time}", from: twilio, to: me)
  end
end