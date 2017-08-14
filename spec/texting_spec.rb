require 'twilio-ruby'
require 'takeaway'

describe Texting do
  let(:mock_client) { double :Client }
  let(:mock_client1) { double :Client }
  let(:mock_client2) { double :Client }
  let(:mock_client3) { double :Client }
  let(:text1) { Texting.new(mock_client) }

  it 'passes through the Twilio API to send messages' do
    allow(mock_client).to receive(:api).and_return(mock_client1)
    allow(mock_client1).to receive(:account).and_return(mock_client2)
    allow(mock_client2).to receive(:messages).and_return(mock_client3)
    allow(mock_client3).to receive(:create).and_return("all methods passed to client")
    expect(text1.send_text(1, "test")).to eq "all methods passed to client"
  end

# not sure how to test as not my code.
# But taken from Twilio website and works so assuming they have tested.

end
