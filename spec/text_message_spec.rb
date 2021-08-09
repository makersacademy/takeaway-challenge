require 'text_message'

describe TextMessage do

  let(:mock_client) { double :mock_client }

  subject { described_class.new(mock_client) }

  before(:each) do
    allow(mock_client).to receive_message_chain(:messages, :create) { "test" }
  end

  it "calls sms_send method with a message" do
    expect(subject.sms_send("test")).to eq("test")
  end

end
