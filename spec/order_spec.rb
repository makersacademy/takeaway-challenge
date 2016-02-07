require 'order'

describe (:order) {described _class.new}
  subject(:order) { described_class.new}

  let(:menu) { double(:menu) }
  let(:dishes) do
    {
      potatoes: 5,
      fish: 4
    }
  end

  before do
    allow(menu).to receive(:has_dish).with(:fish).and_return(true)
  it 'selects several dishes from the menu' do
    order.add(:potatoes, 5)
    order.add(:fish, 4)
    expect(order.dishes).to eq(dishes)
  end

  it 'doesn't allow items to be added that are not on the menu' do
    expect { order.add(:beef, 2) }.to raise_error NoItemError 'Beef is not on the menu'
  end
end
