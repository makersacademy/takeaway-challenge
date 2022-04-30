require 'order'

describe Order do

  subject(:order) {Order.new}
  let(:dish_0) { {id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 0} }
  let(:dish_1) { {id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 1} }
  let(:dish_2) { {id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 2} }
  let(:menu) {instance_double('Menu')}
  

  it 'creates an instance of the order class' do
    expect(order).to be_instance_of(Order)
  end

  it 'initializes with the current_order variable' do
    expect(order.current_order).to eq([])
  end

  describe '#fetch_dish' do

    xit 'creates an instance of a dish from the menu' do
      allow(menu).to receive(:select_dish).and_return(dish_0)
      expect(order.fetch_dish(1)).to eq dish_0
    end

  end

  describe '#add_dish' do

    it 'adds a dish to the current_order' do
      #allow(menu).to receive(:select_dish).and_return(dish_0)
      order.add_dish(1, 1)
      expect(order.current_order).to eq([dish_1])
    end

  end


  describe '#remove_dish' do

    it 'removes the dish from the current order' do
      #allow(menu).to receive(:select_dish).and_return(dish_0)
      order.add_dish(1, 1)
      order.remove_dish(1)
      expect(order.current_order).to eq([])
    end
    
    it 'raises an erro when removing dish that has not been added' do
      expect {order.remove_dish(1)}.to raise_error 'Dish has not been added'
    end

  end


    describe '#update_dish_quantity' do

      it 'updates the quantity if the same dish is added twice' do
        #allow(menu).to receive(:select_dish).and_return(dish_0)
        order.add_dish(1, 1)
        order.add_dish(1, 1)
        expect(order.current_order).to eq([dish_2])
      end
      
      it 'removes the dish from the current order if the quantity is zero' do
        #allow(menu).to receive(:select_dish).and_return(dish_0)
        order.add_dish(1, 1)
        order.update_dish_quantity(1, 0)
        expect(order.current_order).to eq([])
      end

      it 'raises an error when dish has not been added' do
        expect{order.update_dish_quantity(1, 1)}.to raise_error 'Dish has not been added'
      end
  
    end


  it 'calculates total for the current order' do
    #allow(menu).to receive(:select_dish).and_return(dish_0)
    order.add_dish(1, 1)
    order.add_dish(1, 1)
    expect(order.total).to eq 14
  end

end