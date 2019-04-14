require 'order'
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      Chicken_balls: 2,
      beef_in_blackbeans: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:Chicken_balls).and_return(true)
    allow(menu).to receive(:has_dish?).with(:beef_in_blackbeans).and_return(true)

    allow(menu).to receive(:price).with(:Chicken_balls).and_return(3.00)
    allow(menu).to receive(:price).with(:beef_in_blackbeans).and_return(2.50)
end
  it 'selects items from the menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow non menu items to be ordered" do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 2) }.to raise_error NoItemError,"Fish is not on the menu"
  end

  it "calculates the order total" do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end

    def create_order
      order.add(:Chicken_balls, 2)
      order.add(:beef_in_blackbeans, 1)
    end

  end
