require 'order'

describe Order do

  subject(:order) {described_class.new}
  
  context '#add_dishes' do
    it 'stores the selected dishes to the order appropriately' do
      expect{order.add_dishes([[1,1], [3,2]])}.to change{order.dishes}.to eq({1=>1, 3=>2})
    end
  end

  context '#show_dishes' do
    it 'returns dishes stored in that order' do
      order.add_dishes([[1,1], [3,2]])
      expect(order.show_dishes).to eq({1=>1, 3=>2})
    end
  end

  context '#place_order' do
    it 'sets the placed? variable to true' do
      expect{order.place_order}.to change{order.placed}.to eq(true)
    end
  end

end