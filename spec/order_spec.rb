require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      pierogi: 4.00,
      kopytka: 2.00,
      bigos: 5.20
    }
  end

  it 'can select some number of several available dishes' do
    order.add(:pierogi, 4)
    order.add(:kopytka, 2)
    order.add(:bigos, 5.20)
    expect(order.dishes).to eq(dishes)
  end

  it 'cannot add dishes that are not on the menu' do

  end

end
