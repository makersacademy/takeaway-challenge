require 'order'

describe Order do
  let(:test_dish_list_data) { [ { id: :BB, price: 5.0 }, { id: :NC, price: 3.5 } ] }
  let(:test_dish_list) { double('menu', data: test_dish_list_data) }
  let(:test_order) { [ { BB: 2 }, { NC: 1 } ] }
  subject(:order) { described_class.new(test_dish_list) }


  describe '#make' do
    it 'is expected to accept orders' do
      expect { order.make(test_order) }.not_to raise_error
    end
  end
end
