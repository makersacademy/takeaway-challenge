require 'order'

describe Order do

  subject(:order) {described_class.new(menu)}
  let(:dishes) { {Burger: 1, Pizza: 1} }
  let(:menu) {double "menu"}

  it 'adds dishes to the order' do
    order.add(:Burger, 1)
    order.add(:Pizza, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items to be ordered that are not on the menu' do
    expect {order.add(:chips, 2)}.to raise_error "Chips are not available"
  end
end