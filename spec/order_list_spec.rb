require 'order_list'

describe OrderList do

  let(:dish_list){double(:dish_list)}
  subject(:order_list) {described_class.new}

  describe '#prices' do
    it 'gives prices for dish list' do
      expect(dish_list).to receive(:prices)
      order_list.prices(dish_list)
    end
  end
end
