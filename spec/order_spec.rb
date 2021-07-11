require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new({'Chicken Tacos' => 6, 'Water' => 2}) }

  describe '#initialize' do
    it 'initializes new instance of the menu' do
      expect(subject.menu).to be_an_instance_of Menu
    end

    it 'checks that order is empty' do
      expect(subject.order).to be_empty
    end
  end
  
  describe '#print_menu' do
    it 'prints the menu' do
      expect { order.display_menu }.to output("The Menu:\nChicken Tacos: £6\nWater: £2\n").to_stdout
    end
  end
  
  describe '#add_dish error' do
    it 'raises an error if non-existent item is added to order' do
      expect {order.add_dish('donuts')}.to raise_error('Sorry, this item is not on our menu.')
    end

  end
  
  describe '#add_dish to order' do
    it 'adds a dish to the order' do
      order.add_dish('Chicken Tacos', 1)
      expect(order.order).to eq([{'Chicken Tacos' => 6}])
    end
  end

  # describe '#print_total' do
  #   it 'prints the total of your order' do
  #     order.add_dish('Chicken Tacos', 1)
  #     expect{ order.print_total }.to output("The total for your order is £6\n").to_stdout
  #   end
  # end

end