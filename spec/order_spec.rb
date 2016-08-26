require 'order.rb'

describe Order do
  let()

  context '#order_total' do
    it 'totals the bill correctly' do
      pending("need to stub an order")
    end

    it 'returns 0 for an empty order' do
      expect(subject.order_total).to eq(0)
    end
  end

  context '#add_to_order' do

    
  end
end
