require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new }
  let(:dishes) do
    {
     Pasta: 2,
     Chicken: 2
    }
  end

  describe '#add' do
    it 'adds dishes to the order' do
      order.add(:Pasta, 2)
      order.add(:Chicken, 2)
      expect(order.dishes).to eq(dishes)
    end
  end

end
