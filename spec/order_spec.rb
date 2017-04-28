require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double :menu }

  let(:menu_items) do
    {
      burger: 2,
      fries: 1
    }
  end

  before do
    allow(menu).to receive(:in_menu?).with(:burger).and_return(true)
    allow(menu).to receive(:in_menu?).with(:fries).and_return(true)

    allow(menu).to receive(:price).with(:burger).and_return(3.00)
    allow(menu).to receive(:price).with(:fries).and_return(1.50)
  end

  describe '#add' do
    it "adds selected menu items to order" do
      order.add(:burger, 2)
      order.add(:fries, 1)
      expect(order.menu_items).to eq menu_items
    end

    it "raises an error if you attempt to add item not on menu" do
      allow(menu).to receive(:in_menu?).with(:lasagne).and_return(false)
      expect { order.add(:lasagne, 3) }.to raise_error "Sorry, lasagne is not on the menu, please make another selection!"
    end
  end

  describe '#total' do
    it 'calculates the order total' do
      order.add(:burger, 2)
      order.add(:fries, 1)
      total = 7.50
      expect(order.total).to eq(total)
    end
  end

end
