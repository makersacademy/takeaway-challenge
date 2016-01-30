require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu_klass)}
  let(:menu_klass) { double :menu_klass, new: menu}
  let(:menu) {double(:menu, dishes: dish_1, price: price)}
  let(:price){6}
  let(:dish_1) {double 'chicken'}
  let(:dish_2) {double 'pizza'}

  describe '#initialize' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#show_menu' do
    it 'allows the user to see a copy of the menu' do
      allow(menu).to receive(:dishes) { {'pizza' => 4} }
      expect(takeaway.show_menu).to eq ({'pizza' => 4})
    end
  end

  describe '#order' do
    it 'allows the user to order items from the menu' do
      takeaway.order(dish_1)
      expect(takeaway.basket).to eq ({"#{dish_1} x1"  => price})
    end
  end
end
