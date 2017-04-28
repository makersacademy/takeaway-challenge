require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      sushi: 4,
      ramen: 3,
      udon: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:sushi).and_return(true)
    allow(menu).to receive(:has_dish?).with(:ramen).and_return(true)
    allow(menu).to receive(:has_dish?).with(:udon).and_return(true)
  end

  it "selects several dishes from the meny" do
    order.add(:sushi, 4)
    order.add(:ramen, 3)
    order.add(:udon, 2)
    expect(order.dishes).to eq(dishes)
  end

  it "only allows listed dishes to be added" do
    allow(menu).to receive(:has_dish?).with(:curry).and_return(false)
    expect { order.add(:curry, 4) }.to raise_error NoItemError, "Curry not avaliable"
  end
end
