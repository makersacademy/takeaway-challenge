require 'order_summary'

describe OrderSummary do

  subject(:order_summary) { described_class.new }
  let(:order) { double('order', :items => {}) }

  context 'order summary' do
    # before each do
    #   allow(order).to receive(:items) {}

    it 'compiles a summary of the order' do
      expect(order_summary.final_order).to eq(order.items)
    end
  end
end
