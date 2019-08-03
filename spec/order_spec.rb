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
    allow(menu).to receive(:price).with(:duck).and_return(2.00)
    allow(menu).to receive(:price).with(:beer).and_return(2.50)
    allow(menu).to receive(:price).with(:fries).and_return(1.50)
  end

  describe "#add" do
    it 'takes several dishes from menu and add them to order' do
      order.add(:duck,1)
      order.add(:beer,3)
      order.add(:fries,3)
      expect(order.dishes).to eq(dishes)
    end
  end

  it 'raise an error when trying to add dish from outside the menu' do
    allow(menu).to receive(:include_dish?).with(:lemonade).and_return(false)
    expect{order.add(:lemonade,10)}.to raise_error "This is not on the menu!"
  end

  describe "#total" do
    it 'returns total value of the order' do
      order.add(:duck,1)
      order.add(:beer,3)
      order.add(:fries,3)
      total = 14.00
      expect(order.total).to eq total
    end
  end

end