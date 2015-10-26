require 'order_summary'

describe OrderSummary do

  subject(:order_summary) { described_class.new }

  context 'order summary' do

    it 'contains a log of the order' do
      expect(order_summary.basket).to eq({})
    end
  end

end
