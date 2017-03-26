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

  before do
    allow(menu).to receive(:has_dish?).with(fake_dish).and_return(true)
    allow(menu).to receive(:price).with(fake_dish).and_return(4.50)
  end

  describe '#add(dish, quantities)' do
    it 'adds current order to the order'do
      order.add(fake_dish, 2)
      expect(order.dishes).to eq fake_order
    end

    it 'raises an error if dish isn\'t in menu' do
      allow(menu).to receive(:has_dish?).with(:tomatos).and_return(false)
      expect{order.add(:tomatos, 1)}.to raise_error("Can't place order, #{:tomatos} isn't on the menu")
    end
  end

  it 'calculates order total' do
    order.add(fake_dish, 3)
    expect(order.total).to eq "Thank you, order placed: Your total is £13.50"
  end

  it 'calculates just the integer value of total' do
    order.add(fake_dish, 3)
    expect(order.total_value).to eq "%.2f" % 13.50
  end
end
