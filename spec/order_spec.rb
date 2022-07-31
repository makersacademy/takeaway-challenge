require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu)}

  let(:dishes) do
    {
      chicken: 2,
      fish: 1
    }
  end

  

  it "selects several dishes from the menu" do
    order.add(:chicken, 2)
    order.add(:fish, 1)
  expect(order.dishes).to eq(dishes)
  end

  it 'doesnt allow items to be added that are not on the menu' do
     
  end
end