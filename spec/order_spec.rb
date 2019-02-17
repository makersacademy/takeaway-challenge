require 'order'
describe Order do
  subject(:order) { described_class.new }

  let(:dishes) do
    {
      chicken: 2,
      fish: 1
    }
  end

  it 'selects seceral dishes from menu' do
    order.add(:chicken, 2)
    order.add(:fish, 1)
    expect(order.dishes).to eq(dishes)
  end


end
