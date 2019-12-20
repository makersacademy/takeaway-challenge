require'order'

describe Order do
  subject(:order) { described_class.new}
  let(:dishes) do
    {
      rice: 1,
      chips: 2,
      fish: 1
    }
  end

  it "creates and instance of order" do
    expect(subject).to be_a Order
  end

  it "orders dishes" do
    order.add(:rice, 1)
    order.add(:chips, 2)
    order.add(:fish, 1)
    expect(order.dishes).to eq (dishes)
  end

end
