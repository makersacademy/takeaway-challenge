require 'order'

describe Order do
  subject(:test_order) {described_class.new}
  let(:dummy_dish) {double :dish, dish_name: nil, dish_price: 1}

  describe '#show_outstanding_order' do

    before(:each) do
      test_order.add_dish dummy_dish , 1
    end

    it 'returns a human-readable summary of the current order' do
      expect(test_order.show_outstanding_order.class).to eq String
    end

    it 'retrieve dishes info' do
      expect(dummy_dish).to receive(:dish_name)
      test_order.show_outstanding_order
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
