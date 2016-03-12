require 'order'

describe Order do
  subject(:test_order) {described_class.new dummy_menu}
  let(:dummy_menu) {double :menu}
  let(:dummy_dish) {double :dish, dish_price: 10}

  describe '#initalize' do

    it 'is initialized with an empty order' do
      expect(test_order.current_order).to be_empty
    end

    it 'is initalized with the right menu' do
      expect(test_order.menu).to eq dummy_menu
    end

  end

  describe '#add_dish' do

    it 'adds a dish to the current order' do
      test_order.add_dish dummy_dish
      expect(test_order.current_order).to include dummy_dish => 1
    end

  end

  describe '#update_total' do

    it 'recalculate the total bill' do
      test_order.add_dish dummy_dish
      test_order.update_total
      expect(test_order.bill).to eq dummy_dish.dish_price
    end

  end

end
