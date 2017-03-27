require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:item) { double :item }
  let(:menu) { double :menu }
  let(:dishes) {{"Hamburger" => 3.99, "Pizza" => 9.99, "Fish and Chips" => 4.99, "Curry" => 5.99, "Deep Fried Mars Bar" => 0.99, "Coke Zero" => 1.99}}

  describe '#initialize' do
    it 'has a menu' do
      expect(order.menu).to eq menu
    end
  end

  describe '#add' do
    it 'selects dishes from the menu' do
      allow(menu).to receive(:does_not_contain?).with(item).and_return(false)
      expect(order.add(item)).to eq(item)
    end

    it 'fails if item doesnt exist on menu' do
      allow(menu).to receive(:does_not_contain?).with(:beef).and_return(true)
      expect{order.add(:beef)}.to raise_error "beef doesn't exist on the menu"
    end
  end
end
