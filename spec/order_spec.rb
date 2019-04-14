require 'order'

describe Order do
  let(:subject) { described_class.new }

  items = { 'Spring rolls' => 2.99,
  'Prawn toast' => 4.00,
  'Special Chow Mein' => 6.50,
  'Egg Fried Rice' => 2.99 }

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu, dishes: items, show_menu: items) }

  describe '#initialize' do
    it 'should contain an empty array' do
      expect(subject.current_order).to eq []
    end
  end

  describe '#add_item' do
    it 'should add an item to current order' do
      expect(subject.add_item({ 'Spring rolls' => 2.99 })).to include({ 'Spring rolls' => 2.99 })
    end
  end

  context 'items have been added to an order' do
    before do
      subject.add_item('Spring rolls' => 2.99)
      subject.add_item('Special Chow Mein' => 6.50)
      subject.add_item('Egg Fried Rice' => 2.99)
      subject.add_price(2.99)
      subject.add_price(6.50)
      subject.add_price(2.99)
    end

    describe '#display_order' do
      it 'should show the current order and total' do
        expect { subject.display_order }.to output(<<~PRINTOUT
        Current Order
        -----------
        Spring rolls: £2.99
        Special Chow Mein: £6.5
        Egg Fried Rice: £2.99
        Total: £12.48
        PRINTOUT
      ).to_stdout
      end
    end
  end
end
