require 'order'

describe Order do
  subject(:order) {described_class.new(menu: menu)}
  let(:menu) {double(:menu)}
  let(:fake_dish) {:Katsu_Chicken_Wrap}
  let(:fake_order) do
    {
      Katsu_Chicken_Wrap: 2
    }
  end


  describe '#add(dish, quantities)' do
    before do
      allow(menu).to receive(:has_dish?).with(fake_dish).and_return(true)
    end
    it 'adds current order to the order'do
      order.add(fake_dish, 2)
      expect(order.dishes).to eq fake_order
    end

    it 'raises an error if dish isn\'t in menu' do
      allow(menu).to receive(:has_dish?).with(:tomatos).and_return(false)
      expect{order.add(:tomatos, 1)}.to raise_error("Can't place order, #{:tomatos} isn't on the menu")
    end
  end
end
