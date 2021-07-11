require 'order'
require 'menu'

describe Order do

  let(:order) {Order.new({'Bruschetta' => 5, 'Garlic Bread' => 4})}
  
  describe '#initialize' do
    it 'initializes with instance of Menu' do
      expect(subject.menu).to be_an_instance_of Menu
    end
    it 'initializes with an empty order' do
      expect(subject.order).to be_empty
    end
  end

   describe '#display_menu' do
     it 'displays given menu' do
       expect { order.display_menu }.to output("Menu:\nBruschetta: £5\nGarlic Bread: £4\n").to_stdout
     end
    end

  describe '#add_item' do
    it 'raises an error if the item is not on the menu' do
      expect { order.add_item('Peas') }.to raise_error('This item is not on the menu')
    end
    it 'adds an item to the order' do
      order.add_item('Bruschetta')
      expect(order.order).to eq([{'Bruschetta' => 5}])
    end
    it 'adds a given number of dishes' do
      order.add_item('Bruschetta', 3)
      expect(order.order).to eq([{'Bruschetta' => 5}, {'Bruschetta' => 5}, {'Bruschetta' => 5}])
    end
  end

 
end
