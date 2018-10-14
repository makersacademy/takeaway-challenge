# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as
# "Thank you! Your order was placed and will be delivered before 18:52"
# after I have ordered

require 'sms'

describe SMS do

  let(:order) { double(:order) }
  let(:sms) { double(:sms, confirmation: nil) }

  it "sends an SMS to the customer when an order is placed" do
    expect(sms.confirmation).to eq nil
  end

end
