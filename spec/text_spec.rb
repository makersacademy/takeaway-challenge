require 'text'

  describe Text do

    subject(:text) { described_class.new(client) }
    let(:client) { double :client, messages: messages }
    let(:messages) { double :messages }

    describe '#send_text' do
      it 'sends a text' do
        expect(messages).to receive(:create)
        text.send_text('Thank you! Your order was placed and will be delivered before 18:52')
      end
    end

  end
