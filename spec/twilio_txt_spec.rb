require 'twilio_txt'

describe Sms do

  let!(:client) { double(:client) }
  let(:subject) { Sms.new(client) }

  it 'returns a message when called' do
    chain = "account.messages.create"
    allow(client).to receive_message_chain(chain) { 'output message' }
    expect(subject.call).to eq 'output message'
  end
end
