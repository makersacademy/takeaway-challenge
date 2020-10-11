require 'order'
describe Order do
  subject(:order) { Order.new }

  describe '#initialize' do
    it 'initializes with an empty basket' do 
      expect(order.basket).to eq({})
    end
  end
end
