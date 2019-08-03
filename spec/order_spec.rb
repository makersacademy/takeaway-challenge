require_relative '../lib/order'

describe Order do
  let(:menu) {double :menu}
  subject(:order) {described_class.new(menu)}
  let(:dishes) do
    {
      duck: 1,
      beer: 3,
      fries: 3
    }
  end

  before do
    allow(menu).to receive(:include_dish?).with(:duck).and_return(true)
    allow(menu).to receive(:include_dish?).with(:beer).and_return(true)
    allow(menu).to receive(:include_dish?).with(:fries).and_return(true)
  end

  it 'takes several dishes from menu' do
    order.add(:duck,1)
    order.add(:beer,3)
    order.add(:fries,3)
    expect(order.dishes).to eq(dishes)
  end

  it 'raise an error when trying to add dish from outside the menu' do
    allow(menu).to receive(:include_dish?).with(:lemonade).and_return(false)
    expect{order.add(:lemonade,10)}.to raise_error "This is not on the menu!"
  end
end