require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:dishes) do {
    dish1: 2.50, 
    dish2: 1.50 
  }
end

  it "selects several dishes from the menu" do
    order.add(:dish1, 2.5)
    order.add(:dish2, 1.5)
    expect(order.dishes).to eq dishes
  end
end