require 'order'
describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      chicken: 2,
      fish: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
  end

  it 'selects several dishes from menu' do
    order.add(:chicken, 2)
    order.add(:fish, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'doesnt allow items to be added that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error 'Beef is not on the menu!'
  end
end
