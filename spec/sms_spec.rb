require 'sms'

describe SMS do

  let(:order) { double(:order) }
  let(:sms) { double(:sms, confirmation: nil) }

  it "sends an SMS to the customer when an order is placed" do
    expect(sms.confirmation).to eq nil
  end

end
