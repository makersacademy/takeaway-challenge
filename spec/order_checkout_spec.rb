# frozen_string_literal: true

require 'order'

describe Order do
  subject(:an_order) { described_class.new }
  let(:message) { double :message }

  describe '#add' do
    it 'should add multiple items to an order' do
      allow(an_order).to receive_message_chain(:menu, :items, :[]) { 1 }
      an_order.add('item', 1)
      an_order.add('item', 2)
      expect(an_order.order).to eq(
        [{ item: 'item', num: 1 }, { item: 'item', num: 2 }]
      )
    end
  end

  describe '#checkout' do
    it 'should call message.send' do
      expect(message).to receive(:send)
      an_order.checkout(0, message)
    end

    it 'should return the message sid once a message is sent' do
      allow(message).to receive(:send) { 'sent' }
      expect(an_order.checkout(0, message)).to eq('sent')
    end
  end
end
