require 'restaurant'

describe Restaurant do

  let(:menu_klass) {double :menu_klass}
  let(:menu) {double :menu}
  let(:text_klass) {double :text_klass}

  subject(:restaurant) { described_class.new(menu_klass, text_klass) }

  before do
    allow(menu_klass).to receive(:new)
    allow(menu_klass).to receive(:list).and_return(:item_1 => 5, :item_2 => 3)
    allow(text_klass).to receive(:new)
    allow(text_klass).to receive(:send_message)
    subject.add_item(:item_1)
    subject.add_item(:item_2)
  end

  describe '#display_menu' do

    it 'displays a menu' do
      expect(subject.display_menu).to eq(:item_1 => 5, :item_2 => 3)
    end

  end

  describe '#add_item' do

    it 'allows a customer to add items' do
      expect(subject.order).to eq(:item_1 => 1, :item_2 => 1)
    end

    it 'raises an error when an item is not on the menu' do
      expect{subject.add_item(:item_3)}.to raise_error('No such item on the menu')
    end

  end

  describe '#remove_item' do

    it 'allows a customer to remove items' do
      subject.remove_item(:item_1)
      expect(subject.order_summary).to eq('1 x item_2 = £3.00')
    end

    it 'raises an error when an item is not in the order' do
      expect{subject.remove_item(:item_3)}.to raise_error('No such item in your order')
    end

  end

  describe '#order_total' do

    it 'calculates the sum of the prices of the items in the order' do
      expect(subject.order_total).to eq "Order Total: £8.00"
    end

  end

  describe '#order_summary' do

    it 'provides a summary of the current order' do
      expect(subject.order_summary).to eq('1 x item_1 = £5.00, 1 x item_2 = £3.00')
    end

    it 'allows the default quantity to be over-ridden' do
      subject.add_item(:item_1, 3)
      subject.add_item(:item_2, 2)
      expect(subject.order_summary).to eq('3 x item_1 = £15.00, 2 x item_2 = £6.00')
    end

  end

  describe '#place_order' do

    it 'raises an error if the wrong payment amount is submitted' do
      expect{subject.place_order(7.00)}.to raise_error("Wrong payment amount")
    end

    it 'activates a payment confirmation text message' do
      expect(text_klass.new).to receive(:send_message)
      subject.place_order(8.00)
    end

  end

end
