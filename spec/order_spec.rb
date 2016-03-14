require 'order'

describe Order do
  subject(:test_order) {described_class.new}
  let(:dummy_dish) {double :dish, dish_price: 1}

  describe '#add_dish' do

    it 'adds a dish to the current order' do
      test_order.add_dish dummy_dish , 1
      expect(test_order.show_outstanding_order).to include dummy_dish => 1
    end

  end

  describe '#update_total' do

    it 'recalculate the total bill' do
      test_order.add_dish dummy_dish , 1
      test_order.update_total
      expect(test_order.total_bill).to eq dummy_dish.dish_price
    end

  end

end
