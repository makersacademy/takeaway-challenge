require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double :menu}

  let(:customer_order) do
    {
      "spring roll"=>0.99,
      "char sui bun"=>3.99
    }
  end


  describe '#add' do
    it 'adds a dish to an order' do
      order.add "spring roll", 0.99
      order.add "char sui bun", 3.99
      expect(order.customer_order).to eq(customer_order)
    end
  end
end
