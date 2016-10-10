require 'order'

describe Order do

    let(:burger) {double :dish, name: "burger", price: 15}
    let(:salad) {double :dish, name: "salad", price: 12}
    let(:sandwich) {double :dish, name: "sandwich", price: 7}
    let(:menu) {double :menu, dishes: [burger, salad]}
    subject(:my_order){described_class.new(menu)}

    it 'is initialized with empty array' do
      expect(my_order.selection).to be_empty
    end

    describe '#add_dish' do
      it 'adds dish to the array' do
        my_order.add_dish(salad, 3)
        expect(my_order.selection).to include(salad)
      end

      it 'wont let you add a dish that is not on the menu' do
        expect {my_order.add_dish(sandwich, 2)}.to raise_error 'That dish is not available'
      end
    end

    describe '#total_price' do
      it 'calculates total price of order' do
        my_order.add_dish(salad, 2)
        my_order.add_dish(burger, 1)
        expect(my_order.total_price).to eq (2*salad.price + burger.price)
      end
    end

end
