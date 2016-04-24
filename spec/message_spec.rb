require 'message'

describe Message do
  let(:message) { described_class.new }
  let(:text) { "Thank you! Your order was placed and will be delivered before 19:00" }


  describe 'send' do
    xit 'sends a confirmation message' do
      allow(message).to receive(:send) { text }
      expect(message.send).to eq text
    end
  end

end
