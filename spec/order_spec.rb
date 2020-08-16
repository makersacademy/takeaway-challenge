require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:dishes) { {Burger: 1, Pizza: 1} }

  it 'adds dishes to the order' do
    order.add(:Burger, 1)
    order.add(:Pizza, 1)
    expect(order.dishes).to eq(dishes)
  end


end