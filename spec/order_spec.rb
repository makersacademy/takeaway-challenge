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

  describe '#summary' do
    it 'prints the order summary' do
      @order.add(@dish_double)
      @order.add(@dish_double, 2)
      expect(@order.summary).to eq("yummy x 1 = £0.99\nyummy x 2 = £1.98")
    end
  end

  describe '#total_price' do
  
    it 'calculates and returns the total price of the order' do
      @order.add(@dish_double)
      @order.add(@dish_double, 2)
      expect(@order.total_price).to eq(2.97)    
    end
  end

  describe '#place_order' do

    it 'raises an error if the user does not confirm the total price' do
      @order.add(@dish_double)
      @order.add(@dish_double, 2)
      expect { @order.place_order(1.97) }.to raise_error(RuntimeError)
    end

  end
end