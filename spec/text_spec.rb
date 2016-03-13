require 'text'

describe Text do
  subject(:text) {described_class.new}

  let(:client) { double :client, account: account }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :message, create: nil }
  
  it {is_expected.to respond_to(:send_message).with(1).argument }

  # describe '#send_message' do
  #   it 'sends a message' do
  #     confirmation_message = "Your order costs: £55 and will arrive before 10:00"
  #     expect(messages).to receive(:create)
  #     text.send_message(confirmation_message)
  #   end
  # end

end
