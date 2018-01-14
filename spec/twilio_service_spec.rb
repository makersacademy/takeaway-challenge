require 'twilio_service'
require 'twilio-ruby'

describe TwilioService do
  subject(:twilio_service) { described_class.new }
  let(:client) { double :client }
  let(:api) { double :api }
  let(:account) { double :account }
  let(:messages) { double :messages }

  before(:each) do
    allow(Twilio::REST::Client).to receive(:new).and_return client
    allow(client).to receive(:api).and_return api
    allow(api).to receive(:account).and_return account
    allow(account).to receive(:messages).and_return messages
    allow(messages).to receive(:create)
  end

  it 'creates a Twilio REST client' do
    expect(twilio_service.client).to eq client
  end

  it 'sends an SMS' do
    expect(messages).to receive(:create).with({ from: twilio_service.twilio_number, to: "Test number", body: "Test message" }).once
    twilio_service.send_sms("Test number", "Test message")
  end
end
