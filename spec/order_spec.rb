require 'order'

describe Order do
  subject(:test_order) {described_class.new}
  let(:dummy_menu) {double :menu, retrieve_price: 1}

  describe '#initalize' do

    it 'is initialized with an empty order' do
      expect(test_order.current_order).to be_empty
    end

  end

  describe '#add_dish' do

      xit 'adds a given dish and amount to the current order' do
        test_order.add_dish :dish_1 , 2
        expect(test_order.current_order)
      end

  end

  describe '#update_total' do

  end

end
