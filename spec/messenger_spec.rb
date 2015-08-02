require "messenger"

describe Messenger do

  let(:order) { double(:order, contact_number: "+4407572437603" ) }

  before do
    allow(subject). to receive(:send_to_twilio) {:true}
  end

  it "sends message via twilio" do
    expect(subject.send_message(order)).to be :true
  end
end
