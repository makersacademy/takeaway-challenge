require 'counter'

describe Counter do

  let(:menu) { double(:menu, show: nil ) }
  let(:dish) { double(:dish) }
  let(:price) { double(:price) }
  subject(:counter) { described_class.new(menu) }

  describe '#show_menu' do
    it 'shows the menu' do
      expect(counter.show_menu).to eq menu.show
    end
  end
  describe '#add_dish' do
    it 'adds an item to the counter\'s menu (invalid test)' do
      allow(menu).to receive(:add_item).with(dish, price)
      # expect(counter).to receive(:add_item(dish,price).and_return(price)
    end
  end
  describe '#remove_dish' do
    it 'remove an item from the counter\'s menu (invalid test)' do
      allow(menu).to receive(:remove_item).with(dish, price)
      # expect(counter).to receive(:add_item(dish,price).and_return(price)
    end
  end
end
