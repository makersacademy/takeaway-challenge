require 'restaurant'

describe Restaurant do

let(:menu_klass) {double :menu_klass}
let(:menu) {double :menu}
let(:text_klass) {double :text_klass}

before do
  allow(menu_klass).to receive(:new)
  allow(menu_klass).to receive(:list).and_return(:item_1 => 5, :item_2 => 3)
end

subject(:restaurant) { described_class.new(menu_klass, text_klass) }

  describe '#display_menu' do

    it 'displays a menu' do
      expect(subject.display_menu).to eq(:item_1 => 5, :item_2 => 3)
    end

  end

  describe '#add_item' do

    it 'allows a customer to add items' do
      subject.add_item(:item_1)
      subject.add_item(:item_2)
      expect(subject.order).to eq(:item_1 => 1, :item_2 => 1)
    end

    it 'raises an error when an item is not on the menu' do
      subject.add_item(:item_1)
      subject.add_item(:item_2)
      expect{subject.add_item(:item_3)}.to raise_error('No such item on the menu')
    end

  end

  describe '#item_count' do

    it 'sums the number of items in the basket' do
      subject.add_item(:item_1)
      subject.add_item(:item_2)
      expect(subject.item_count).to eq 2
    end

  end

  describe '#order_total' do

    it 'calculates the sum of the prices of the items in the order' do
      subject.add_item(:item_1)
      subject.add_item(:item_2)
      expect(subject.order_total).to eq "Order Total: £8.00"
    end

  end

  describe '#order_summary' do

    it 'provides a summary of the current order' do
      subject.add_item(:item_1)
      subject.add_item(:item_2)
      expect(subject.order_summary).to eq('1 x item_1 = £5.00, 1 x item_2 = £3.00')
    end

  end

  describe '#place_order' do

    it 'sends a payment confirmation text message' do
      allow(text_klass).to receive(:send_message).and_return("Thank you for your payment of £8.00")
      subject.add_item(:item_1)
      subject.add_item(:item_2)
      subject.place_order(8.00)
    end

  end

end
