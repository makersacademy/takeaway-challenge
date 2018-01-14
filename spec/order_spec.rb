require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") } #verifying double

  let(:dishes) do
    {
      pierogi: 4.00,
      kopytka: 2.00,
      bigos: 5.20
    }
  end

  before do
    allow(menu).to receive(:dish_exists?).with(:pierogi).and_return(true)
    allow(menu).to receive(:dish_exists?).with(:kopytka).and_return(true)
    allow(menu).to receive(:dish_exists?).with(:bigos).and_return(true)
  end

  it 'can select some number of several available dishes' do
    order.add(:pierogi, 4)
    order.add(:kopytka, 2)
    order.add(:bigos, 5.20)
    expect(order.dishes).to eq(dishes)
  end

  it 'cannot add dishes that are not on the menu' do
    allow(menu).to receive(:dish_exists?).with(:ramen).and_return(false)
    expect { order.add(:ramen, 10.50) }.to raise_error NoItemError, "This ramen is not on the menu!"
  end

  it 'calculates the total sum for the order' do
    order.add(:pierogi, 4)
    order.add(:kopytka, 2)
    order.add(:bigos, 5.20)
    total = 11.20
    expect(order.total).to eq(total)
  end

end
