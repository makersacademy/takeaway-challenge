require 'order'
describe Order do
  subject(:order) { described_class.new}

  let(:dishes) do
    {
      fries: 3,
      avocado: 4
    }
  it 'allows a customer to select several dishes from the menu'
  order.add(:fries, 3)
  order.add(:avocado, 4)
  expect(order.dishes).to eq(dishes)
end
