require 'takeaway'

describe Takeaway do
  let(:dish) {"margherita"}
  let(:dish2) {"garlic bread"}
  let(:price) {4.50}
  let(:menu) {double(:menu, dishes: dish, price: price)}
  subject(:takeaway) {described_class.new(menu)}

  context 'reading a menu' do
    it 'can access the menu' do
      expect(takeaway.menu).to eq menu.dishes
    end
  end

  context 'ordering' do
    it 'can take an order' do
      expect(takeaway).to respond_to :order
    end

    it 'starts with an empty basket' do
      expect(takeaway.basket).to eq({})
    end

    it 'can remember an order' do
      takeaway.order(dish)
      expect(takeaway.basket).to eq ({"#{dish} x1"  => price})
    end

    it 'can remember an order of more than one of a dish' do
      takeaway.order(dish, 3)
      expect(takeaway.basket).to eq ({"#{dish} x3"  => price*3})
    end

    it 'can remember more than one order' do
      takeaway.order(dish)
      takeaway.order(dish2, 2)
      basket = ({"#{dish} x1"  => price, "#{dish2} x2" => price *  2})
      expect(takeaway.basket).to eq basket
    end
  end
end