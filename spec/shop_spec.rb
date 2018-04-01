require 'shop'

describe Shop do
  
  subject { Shop.new }

  before(:each) do
    @dishes = instance_double('Dishes')
    @empty_dishes = instance_double('Dishes')
    @order = instance_double('Order')
    allow(@order).to receive(:add_item).with("Fake dish", 3) { "Fake dish added" }
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
  end
end
