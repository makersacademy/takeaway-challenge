require 'order'

describe Order do
  subject(:order) { Order.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      "fried rice": 2,
      "fish curry": 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:"fried rice").and_return(true)
    allow(menu).to receive(:has_dish?).with(:"fish curry").and_return(true)
  end

  it 'selects several dishes from the menu' do
    order.add(:"fried rice", 2)
    order.add(:"fish curry", 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'doesnt allow any items to be added to the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2)}.to raise_error "Beef is not on the menu."
  end
end