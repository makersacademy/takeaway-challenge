require 'order'

describe Order do

  subject(:order) { Order.new }
  let(:dish0) { { id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 0 } }
  let(:dish1) { { id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 1 } }
  let(:dish2) { { id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 2 } }
  let(:menu) { instance_double('Menu') }
  

  it 'creates an instance of the order class' do
    expect(order).to be_instance_of(Order)
  end

  it 'initializes with the current_order variable' do
    expect(order.current_order).to eq([])
  end

  it 'initializes with the order_placed variable' do
    expect(order.order_placed).to eq false
  end

  it 'shows all of the dishes' do
    allow(menu).to receive(:display).and_return("2. Veggie Breakfast - £8 - available")
    expect(order.show_dishes[1]).to eq("2. Veggie Breakfast - £8 - available")
  end

  describe '#select_dish' do ### tested the method when wasn't private

    it 'selects a dish from the menu' do
      allow(menu).to receive_messages(:select_dish => dish0)
      dish = menu.select_dish(1)
      expect(dish).to eq dish0
    end

    xit 'fails if id is invalid' do ### this works in irb but not in rspec, what could be the reason? 
      # tested when the method wasn't private
      allow(menu).to receive(:select_dish).and_raise('Invalid id')
      dish = menu.select_dish(1)
      expect { dish }.to raise_error 'Invalid id'
    end

    xit 'fails if dish is unavailable' do ### same as above
      allow(menu).to receive_messages(:select_dish => dish0, :id_valid? => true, :dish_available? => false)
      dish = menu.select_dish(1)
      expect { dish }.to raise_error 'Dish unavailable'
    end

  end

  describe '#add_dish' do ### this still uses the Menu class; how coud it stub it?

    it 'adds a dish to the current_order' do 
      order.add_dish(1, 1)
      expect(order.current_order).to eq([dish1])
    end

    it 'fails if id is invalid' do
      expect { order.add_dish(33, 1) }.to raise_error 'Invalid id'
    end

    it 'fails if dish is unavailable' do
      expect { order.add_dish(12, 1) }.to raise_error 'Dish unavailable'
    end

  end

  describe '#remove_dish' do

    it 'removes the dish from the current order' do
      order.add_dish(1, 1)
      order.remove_dish(1)
      expect(order.current_order).to eq([])
    end
    
    it 'raises an erro when removing dish that has not been added' do
      expect { order.remove_dish(1) }.to raise_error 'Dish has not been added'
    end

  end

    describe '#update_dish_quantity' do

      it 'updates the quantity if the same dish is added twice' do
        order.add_dish(1, 1)
        order.add_dish(1, 1)
        expect(order.current_order).to eq([dish2])
      end
      
      it 'removes the dish from the current order if the quantity is zero' do
        order.add_dish(1, 1)
        order.update_dish_quantity(1, 0)
        expect(order.current_order).to eq([])
      end

      it 'raises an error when dish has not been added' do
        expect { order.update_dish_quantity(1, 1) }.to raise_error 'Dish has not been added'
      end
  
    end

  xit 'shows the current order' do ### test pending, method prints & doesn't return statements
    order.add_dish(2, 1)
    expect(order.show_current_order).to eq("1 x #2 Veggie Breakfast - £8" + "Order total: £14")
  end

  it 'fails to show current order if empty' do
    expect { order.show_current_order }.to raise_error 'Current order empty'
  end

  it 'calculates total for the current order' do
    order.add_dish(1, 1)
    order.add_dish(1, 1)
    expect(order.total).to eq 14
  end

  it 'fails to calculate total if current order is empty' do
    expect { order.total }.to raise_error 'Current order empty'
  end

  it 'places order' do
    order.add_dish(1, 1)
    order.add_dish(1, 1)
    expect { order.place_order }.to output.to_stdout
  end

  it 'fails to place order if current order is empty' do
    expect { order.place_order }.to raise_error 'Current order empty'
  end

end
