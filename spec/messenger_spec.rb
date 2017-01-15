require 'messenger'

describe Messenger do

  let(:messenger) { instance_double("messenger") }

  before do
    allow(messenger).to receive(:send)
  end

  it "sends a message upon confirmation" do
    expect(messenger).to receive(:send).with("This is a test with a double and a stub.")
    messenger.send("This is a test with a double and a stub.")
  end

end
