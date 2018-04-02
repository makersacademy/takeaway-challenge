require 'shop'

describe Shop do
  
  subject(:shop_empty) { Shop.new }
  subject(:shop_plus_menu) { Shop.new }
  subject(:shop_menu_orders) { Shop.new }

  before(:each) do
    @communicator = instance_double('Communicator')
    allow(@communicator).to receive(:send)
    @dishes = instance_double('Dishes')
    allow(@dishes).to receive(:describe) { "Fake dish1\nFake dish2" }
    allow(@dishes).to receive(:get_dish).with(1) { "Fake dish" }
    allow(@dishes).to receive(:get_dish).with(-1).and_raise(Dishes::ERRORS[:no_dish])
    shop_plus_menu.instance_variable_set(:@menu, @dishes)
    @order = instance_double('Order')
    allow(@order).to receive(:state) { :in_progress }
    allow(@order).to receive(:add_item).with("Fake dish", 3) { "Fake dish added" }
    allow(@order).to receive(:calculate_total) { 10 }
    allow(@order).to receive(:describe) { "Fake order description" }
    shop_menu_orders.instance_variable_set(:@menu, @dishes)
    shop_menu_orders.instance_variable_set(:@orders, [@order])
    shop_menu_orders.instance_variable_set(:@communicator, @communicator)
    @empty_dishes = instance_double('Dishes')
    allow(@empty_dishes).to receive(:describe).and_raise("No dishes currently available")
    shop_empty.instance_variable_set(:@menu, @empty_dishes)
  end
     
  describe '#show_menu (show available dishes with prices)' do
    context 'success' do
      it 'shows the list of dishes on menu' do
        expect { shop_plus_menu.show_menu }.to output("Fake dish1\nFake dish2\n").to_stdout 
      end
    end

    context 'failure' do
      it 'outputs info string if menu empty' do
        expect { shop_empty.show_menu }.to output("No dishes currently available\n").to_stdout
      end
    end
  end

  describe '#order (order a number of dishes identified by id)' do

    context 'failure' do
      it 'returns with an info string if quantity not in (1..12)' do
        expect(shop_plus_menu.order 3, -8).to eq Shop::MESSAGES[:invalid_quantity]
    end
  
      it 'outputs an info string if dish not found' do
        expect { shop_plus_menu.order -1, 3 }.to output(Shop::MESSAGES[:invalid_id]).to_stdout
      end    
    end

    context 'success' do
      it 'adds an order item to the latest order and returns info string' do
        expect { shop_menu_orders.order 1, 3 }.to output("Fake dish added\n").to_stdout
      end      
    end
  end

  describe '#checkout (finalize an order)' do
    context 'failure' do
      it 'returns with an info string if no items in order' do
        expect(shop_empty.checkout).to eq Shop::MESSAGES[:no_items]
      end
 
      it 'returns with an info string if all orders are completed' do
        allow(@order).to receive(:state) { :completed }
        expect(shop_menu_orders.checkout).to eq Shop::MESSAGES[:no_items]
      end 

     it 'outputs an info string if latest order totals to 0' do
       allow(@order).to receive(:calculate_total) { 0 }
       expect(shop_menu_orders.checkout).to eq Shop::MESSAGES[:no_items]
      end 
    end

    context 'success' do
      it 'sets the last order to complete' do
        expect(@order).to receive(:complete!)
        shop_menu_orders.checkout
      end

      it 'outputs a message with confirmation and total' do
        allow(@order).to receive(:complete!)
        expect { shop_menu_orders.checkout }.to output(Shop::MESSAGES[:confirm]).to_stdout
      end
    end
  end

  describe '#show_bill/show_order (show an order in progress or bill)' do
    context 'failure' do
      it 'returns with a message if no orders available' do
        expect(shop_empty.show_bill).to eq Shop::MESSAGES[:no_orders]
      end
    end

    context 'success' do
      it 'returns a description of the last order' do
        expect { shop_menu_orders.show_bill }.to output("Fake order description\n").to_stdout
      end
    end
  end

  describe '#remove (remove an order item identified by id)' do
    context 'failure' do
      it 'returns with an info string if there are no orders' do
        expect(shop_empty.remove 'ABCD').to eq Shop::MESSAGES[:cannot_modify]
      end

      it 'returns with an info string if all orders are completed' do
        allow(@order).to receive(:state) { :completed }
        expect(shop_menu_orders.remove 'ABCD').to eq Shop::MESSAGES[:cannot_modify]
      end      

      it 'returns with an info string if an invalid id is passed' do
        allow(@order).to receive(:remove_item).with('A1234').and_raise(Order::MESSAGES[:not_found])
        expect(shop_menu_orders.remove 'A1234').to eq Shop::MESSAGES[:invalid_item_id]
      end
    end

    context 'success' do
      it 'removes the order item with the given id' do
        expect(@order).to receive(:remove_item).with('X5678')
        shop_menu_orders.remove 'X5678'
      end
    end
  end
end
