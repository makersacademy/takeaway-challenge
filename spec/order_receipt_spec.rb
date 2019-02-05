# frozen_string_literal: true

require 'order'

describe Order do
  subject(:an_order) { described_class.new }
  let(:message) { double :message }

  describe '#receipt_middle' do
    it 'should print the middle portion of the list' do
      allow(an_order).to receive_message_chain(:menu, :items, :[]) { 1 }
      an_order.order << { item: 'foo', num: 1 }
      expect { an_order.receipt_middle }.to output(
        "1 x foo                        £1.00\n"
      ).to_stdout
    end
  end

  describe '#receipt_footer' do
    it 'should print the bottom portion of the list' do
      expect { an_order.receipt_footer }.to output(
        "------------------------------------\n" \
        "Total:                         £0.00\n\n"
      ).to_stdout
    end
  end
end
