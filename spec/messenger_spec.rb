require "messenger"

describe Messenger do

  let(:order) { double(:order, contact_number: "+4407572437603" ) }
  let(:invalid_number_order) { double(:order, contact_number: "+4sdsdsdsdsdsdddddddd" ) }

  before do
    allow(subject). to receive(:send_to_twilio) {:true}
  end

  it "sends message via twilio" do
    expect(subject.send_message(order)).to be :true
  end

  it "requires a phone valid number" do
    expect{subject.send_message(invalid_number_order)}.to raise_error "invalid phone number"
  end
end
