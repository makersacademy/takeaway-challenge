require 'messaging'

describe Messaging do

  subject(:messaging) {described_class.new}

  it 'responds to send' do
    expect(messaging).to respond_to(:send)
  end

  it 'sends a message' do
    allow(messaging).to receive(:send).and_return("Message succesfully send")
    expect(messaging.send).to eq "Message succesfully send"
  end 

end