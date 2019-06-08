require 'order'

describe Order do

  before(:each) do
    @dish_double = double('dish', name: 'yummy', price: '0.99')
    @order = Order.new
  end
  
  describe '#initialisation' do

    it 'is initialised with an empty array' do
      expect(@order.get(0)).to be_nil
    end
  end

  describe '#add_to_order' do
    before(:each)do
      @order.add(@dish_double)
    end
    
    it 'adds a dish to an order' do
      expect(@order.get(0).keys[0].name).to eq('yummy')
    end

    it 'adds a dish quantity to an order' do
      expect(@order.get(0)[@dish_double]).to eq(1)
    end
  end
end