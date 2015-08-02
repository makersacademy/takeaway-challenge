require "messenger"

describe Messenger do

  let(:order) { double(:order, contact_number: "+4407572437603" ) }

  it "sends message to confirm order" do
    expect(subject.send_message order).to eq("+4407572437603")
  end
end
