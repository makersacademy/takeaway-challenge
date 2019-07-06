require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { :dish }
  let(:quantity) { :quantity }

  describe '#select_dish' do
    it 'selects the dish and its quantity' do
      expect(order.select_dish(dish, quantity)).to eq({ dish => quantity })
    end
  end
end
