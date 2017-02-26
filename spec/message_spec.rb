# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

require 'message'

describe Message do
  subject(:message) { described_class.new(client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  it 'delivers a message with delivery time after order is placed' do
    expect(messages).to receive(:create)
    message.deliver
  end
end
