require 'shop'

describe Shop do
  
  subject { Shop.new }

  before(:each) do
    @dishes = instance_double('Dishes')
    @empty_dishes = instance_double('Dishes')
    @order = instance_double('Order')
    @dish = instance_double('Dish')
    @order_item = instance_double('OrderItem')
    allow(@order_item).to receive(:id) { 'X5678' }
    allow(@order).to receive(:add_item).with("Fake dish", 3) { "Fake dish added" }
    allow(@order).to receive(:state) { :in_progress }
    allow(@dishes).to receive(:describe) { "Fake dish1\nFake dish2" }
    allow(@dishes).to receive(:get_dish).with(1) { "Fake dish" }
    allow(@empty_dishes).to receive(:describe).and_raise("No dishes currently available")
  end
     
  describe '#show_menu' do

    it 'shows the list of dishes on menu' do
      subject.instance_variable_set(:@menu, @dishes)
      expect { subject.show_menu }.to output("Fake dish1\nFake dish2\n").to_stdout 
    end

    it 'outputs info string if menu empty' do
      subject.instance_variable_set(:@menu, @empty_dishes)
      expect { subject.show_menu }.to output("No dishes currently available\n").to_stdout
    end
  end

  describe '#order' do

    it 'returns with an info string if quantity not in (1..12)' do
      expect(subject.order 3, -8).to eq Shop::MESSAGES[:invalid_quantity]
    end
  
    it 'outputs an info string if dish id not valid' do
      expect { subject.order -1, 3 }.to output(Shop::MESSAGES[:invalid_id]).to_stdout
    end    

    it 'creates a new order unless there is one in progress' do
      subject.instance_variable_set(:@menu, @dishes)
      expect { subject.order(1, 3) }.to change { subject.instance_variable_get(:@orders).size }.by(1)
    end

    it 'adds an order item to the latest order and return info string' do
      allow(@order).to receive(:state).and_return(:in_progress)
      subject.instance_variable_set(:@orders, [@order])
      subject.instance_variable_set(:@menu, @dishes)
      expect { subject.order 1, 3 }.to output("Fake dish added\n").to_stdout
    end      
  end

  describe '#checkout' do
    it 'outputs info string if no orders are available' do
      expect(subject.checkout).to eq Shop::MESSAGES[:no_items]
    end
 
    it 'outputs an info string if all orders are completed' do
      subject.instance_variable_set(:@orders, [@order])
      allow(@order).to receive(:state) { :completed }
      expect(subject.checkout).to eq Shop::MESSAGES[:no_items]
    end 

     it 'outputs an info string if latest order totals to 0' do
       allow(@order).to receive(:calculate_total) { 0 }
       subject.instance_variable_set(:@orders, [@order])
       expect(subject.checkout).to eq Shop::MESSAGES[:no_items]
     end 

    it 'sets the last order to complete' do
      subject.instance_variable_set(:@orders, [@order])
      allow(@order).to receive(:calculate_total) { 10 }
      expect(@order).to receive(:complete!)
      subject.checkout
    end

    it 'outputs a message with confirmation and total' do
      subject.instance_variable_set(:@orders, [@order])
      allow(@order).to receive(:calculate_total) { 10 }
      allow(@order).to receive(:complete!)
      expect { subject.checkout }.to output("Thanks for the order. Your total is £10.00. You will shortly receive a confirmation message.\n").to_stdout
    end
  end

  describe '#show_bill' do
    it 'returns with a message if no orders available' do
      expect(subject.show_bill).to eq Shop::MESSAGES[:no_orders]
    end

    it 'returns a description of the last order' do
      subject.instance_variable_set(:@orders, [@order])
      allow(@order).to receive(:describe) { "Fake order description" }
      expect { subject.show_bill }.to output("Fake order description\n").to_stdout
    end
  end

  describe '#remove' do
    it 'returns with an info string if there are no orders' do
      expect(subject.remove 'ABCD').to eq Shop::MESSAGES[:cannot_modify]
    end

    it 'returns with an info string if all orders are completed' do
      subject.instance_variable_set(:@orders, [@order])
      allow(@order).to receive(:state) { :completed }
      expect(subject.remove 'ABCD').to eq Shop::MESSAGES[:cannot_modify]
    end      

    it 'returns with an info string if an invalid id is passed' do
      subject.instance_variable_set(:@orders, [@order])
      allow(@order).to receive(:remove_item).with('A1234').and_raise(Order::MESSAGES[:not_found])
      expect(subject.remove 'A1234').to eq Shop::MESSAGES[:invalid_item_id]
    end

    it 'removes the order item with the given id' do
      subject.instance_variable_set(:@orders, [@order])
      expect(@order).to receive(:remove_item).with('X5678')
      subject.remove 'X5678'
    end
  end
end
