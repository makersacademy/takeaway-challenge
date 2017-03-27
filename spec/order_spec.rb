require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu")}

  let(:dishes) do
    {
      samosa: 4,
      naan: 2
    }
  end

  it 'allows customer to select dishes from menu' do
    order.add(:samosa, 4)
    order.add(:naan, 2)
    expect(order.dishes).to eq(dishes)
  end

  it 'sums the total order amount' do
    allow(menu).to receive(:price).with(:samosa).and_return(3)
    allow(menu).to receive(:price).with(:naan).and_return(1)
    order.add(:samosa, 4)
    order.add(:naan, 2)
    amount = 14
    expect(order.sum).to eq amount
  end

end
