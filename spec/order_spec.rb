require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu)}

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
end
