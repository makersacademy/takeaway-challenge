require 'order'
#
describe Order do
  let(:menu) { double(:menu, dishes: dishes)}
  let(:messager) { double(:messager)}
  let(:dishes) { {menuitem1: 1, menuitem2: 1.50 } }

  subject(:order) { described_class.new(menu_instance: menu, messager: messager)}

  describe '#add' do
    it 'stores name and quantity of dish in basket' do
      order.add(:menuitem1, 2)
      expect(order.basket).to include(menuitem1: 2)
    end
  end

  describe '#overview' do
    it 'returns an empty basket when empty' do
      expect(order.overview).to eq 'Basket is empty'
    end
    it 'returns content of the basket' do
      order.add :menuitem1, 3
      expect(order.overview).to include 'menuitem1 x3'
    end
  end

  describe '#checkout' do
    before do
      msg = "menuitem1 x3: £3\nTotal price: £3"
      allow(messager).to receive(:new).with(msg).and_return("menuitem1 x3: £3\nTotal price: £3")
    end

    it 'returns an empty basket when empty' do
      expect(order.checkout).to eq 'Basket is empty'
    end
    it 'returns message when wrong total' do
      order.add :menuitem1, 3
      expect(order.checkout 2).to eq 'Wrong total'
    end
    it 'logs the current order as processed' do
      order.add :menuitem1, 3
      order.checkout 3
      expect(order.processed).to eq true
    end
    it 'sends a confirmation text' do
      order.add :menuitem1, 3
      expect(order.checkout 3).to eq "menuitem1 x3: £3\nTotal price: £3"
    end
  end

  describe '#reset' do
    it 'empties the basket' do
      order.add :menuitem1, 3
      order.reset
      expect(order.basket).to be_empty
    end
  end
end
