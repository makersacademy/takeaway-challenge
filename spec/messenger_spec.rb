require 'messenger'

describe Messenger do
  subject(:messenger) { described_class.new }
  let(:total) { 10 }
  let(:delivery_time) { Time.now + 3600 }
  let(:body) {
    "Thank you for your order. Delivery estimated for " +
    "#{delivery_time.strftime('%H:%M')}. The total came to #{total}"
  }
  let(:client) { double(:client) }
  let(:messages) { double(:messages) }

  # let(:conf) do
  #   {
  #     sid: "123",
  #     auth: "23fds",
  #     from: "+123",
  #     to: "+234",
  #   }
  # end

  describe '#send' do
    it 'delivers a message with an estimated time' do
      expect(messenger.body(total)).to eq body
    end
  end
end
