require 'order'

describe Order do

  let (:item_number) { 3 }
  let (:quantity) { 2 }
  let (:total_correct) { 10 }
  let (:total_incorrect) { 13 }
  let (:menu) { double :menu, new: :new_instance }

  subject { Order.new(menu) }

  describe '#initialize' do
    it 'initializes with an order array' do
      expect(subject.basket).to be_empty
    end
    it 'initializes with an menu' do
      expect(subject.menu).to_not be_empty
    end
    it 'injects a menu' do
      expect(subject.menu).to eq menu.new
    end
  end

  describe '#add_items' do
    it 'should add items to the basket, along with their quantity and total' do
      expect{subject.add_items(item_number, quantity, total_correct)}.to change{ subject.basket.length }.by 1
    end
  end
end