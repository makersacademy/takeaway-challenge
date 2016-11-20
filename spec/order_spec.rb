require "order"

describe Order do
  subject(:order) { described_class.new }

  let(:menu) do
    {
      Cheeseburger: 8.50,
      Fries: 3.75
    }
  end

  it "has a list of dishes with prices" do
    expect(order.menu).to eq(menu)
  end

end
