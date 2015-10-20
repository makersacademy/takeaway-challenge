require 'twilio'

describe TwilioAPI do

  xit "can calculate the time an hour from now" do
    expect(:delivery_time).to be_within(1.second).of(Time.now)
  end

  it "can text the customer with an order confirmation"

end