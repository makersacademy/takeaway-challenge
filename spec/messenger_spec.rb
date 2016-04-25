require 'messenger'

describe Messenger do
     subject(:messenger) {Messenger.new}
     let(:test_order) {double :test_order}
  describe '#send_order' do
    it 'sends a message confirmming the order' do
        message = "Thank you! Your order:#{test_order}
        will be delivered before 9:15"
        allow(messenger).to receive(:send_order).with(test_order) {message}
        expect(messenger.send_order(test_order)).to eq message
    end
  end
end