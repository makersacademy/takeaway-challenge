require 'order'

describe Order do
  subject(:order) { described_class.new }

  let(:dishes) do
    {
      burger: 1,
      pak_tod: 3
    }
  end

  it "selects several dishes from the menu" do
    order.add(:burger, 1)
    order.add(:pak_tod, 3)
    expect(order.dishes).to eq(dishes)
  end

end