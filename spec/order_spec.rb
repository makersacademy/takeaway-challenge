require 'order'

describe Order do

  before(:each) do
    @dish_double = double('dish', name: 'yummy', price: '0.99')
    @dish_double2 = double('dish2', name: 'scrummy', price: '4.99')
    @menu_double = double('menu')
    allow(@menu_double).to receive(:get_dish_by_name).with('yummy').and_return(@dish_double)
    allow(@menu_double).to receive(:get_dish_by_name).with('scrummy').and_return(@dish_double2)
    @order = Order.new(@menu_double)
  end
  
  describe '#initialisation' do

    it 'is initialised with an empty hash' do
      expect(@order.get(0)).to be_nil
    end
  end

  describe '#add_to_order' do
    before(:each) do
      @order.add('yummy')
    end
  
    it 'adds a dish quantity to an order' do
      expect(@order.get(@dish_double)).to eq(1)
    end
  end

  describe '#summary' do
    it 'prints the order summary' do
      @order.add('yummy')
      @order.add('scrummy', 2)
      expect(@order.summary).to eq("yummy x 1 = £0.99\nscrummy x 2 = £9.98")
    end
  end

  describe '#total_price' do
  
    it 'calculates and returns the total price of the order' do
      @order.add('yummy')
      @order.add('scrummy', 2)
      expect(@order.total_price).to eq(10.97)    
    end
  end

  describe '#place_order' do

    it 'raises an error if the user does not confirm the total price' do
      @order.add('yummy')
      @order.add('scrummy', 2)
      expect { @order.place_order(2.97) }.to raise_error(RuntimeError)
    end

  end
end
