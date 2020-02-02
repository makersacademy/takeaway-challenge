require "order"


describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      pizza: 2,
      soda: 1
    }
  end

  before do 
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:soda).and_return(true)
  end

  it "selects several dishes from the menu " do
    order.add(:pizza, 2)
    order.add(:soda, 1)
    expect(order.dishes).to eq(dishes)
  end

  it "Doesn't allow items to be added that aren't on the menu" do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(false)
    expect { order.add(:chicken, 2) }.to raise_error NoItemError, "Chicken is not on the menu!"

  end



end