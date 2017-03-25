require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:fake_dish) {:Katsu_Chicken_Wrap}
  let(:fake_order) do
    {
      Katsu_Chicken_Wrap: 2
    }
  end

  describe '#add(current_order)' do
    it 'adds current order to the order'do
      order.add(fake_dish, 2)
      expect(order.dishes.last).to eq fake_order
    end
  end
end
