# frozen_string_literal: true

require 'order'

describe Order do
  subject(:an_order) { described_class.new }
  let(:message) { double :message }

  describe '#order' do
    it 'should start out empty' do
      expect(an_order.order).to be_empty
    end
  end

  describe '#show' do
    it "should show an itemised list of the customer's order" do
      expect(an_order).to receive_message_chain(:print_out, :receipt_header)
      expect(an_order).to receive(:receipt_middle)
      expect(an_order).to receive(:receipt_footer)
      an_order.show
    end
  end
end
