require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) { {steak: 1, fish: 2, chips: 2} }

  before do
    allow(menu).to receive(:price).with(:steak).and_return(5.00)
    allow(menu).to receive(:price).with(:fish).and_return(3.00)
    allow(menu).to receive(:price).with(:chips).and_return(1.00)
  end

  it 'chooses several dishes from menu' do
    order.add(:steak, 1)
    order.add(:fish, 2)
    order.add(:chips, 2)
    expect(order.dishes).to eq(dishes)
  end

  it 'calculates the total for order' do
    order.add(:steak, 1)
    order.add(:fish, 2)
    order.add(:chips, 2)
    total = 13
    expect(order.total).to eq(total)
  end
end
