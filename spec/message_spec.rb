# Increased coverage to 93.33%

require 'message'

describe Message do
  let(:twilio_number) { double :twilio_number }
  let(:customer_number) { double :customer_number }
  let(:client) { double :client }

  subject { described_class.new(client, twilio_number) }

  it { is_expected.to respond_to :send }

  it 'sends a message to the user' do
    allow(client).to receive_message_chain(:messages, :create)
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(subject).to receive(:create_message)
    subject.send
  end

end
