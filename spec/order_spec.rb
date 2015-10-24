require 'order'

describe Order do

  let (:item_number) { 3 }
  let (:quantity) { 2 }
  let (:total_correct) { 10 }
  let (:total_incorrect) { 13 }
  let (:menu) { double :menu, new: menu_klass }
  let (:menu_klass) {double :menu_klass, print_items: 'Foo'}

  subject { Order.new(menu) }

  describe '#initialize' do
    it 'with an empty order array' do
      expect(subject.basket).to be_empty
    end
    it 'with an injected menu class' do
      expect(subject.menu).to eq menu_klass
    end
    it 'with a basket balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#view_menu' do
    it 'calls the Order#print_items method' do
      expect(menu_klass).to receive(:print_items)
      subject.view_menu
    end
  end

  describe '#add_items' do
    it 'should add items to the basket' do
      expect{subject.add_items(item_number, quantity, total_correct)}.to change{ subject.basket.length }.by 1
    end
  end
end