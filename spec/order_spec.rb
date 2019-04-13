require 'order'
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      chicken: 1,
      beef: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:beef).and_return(true)
end
  it 'selects items from the menu' do
    order.add(:chicken, 1)
    order.add(:beef, 2)
    expect(order.dishes).to eq(dishes)
  end
  it "doesn't allow non menu items to be ordered" do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 2) }.to raise_error NoItemError,"Fish is not on the menu"
  end
end
