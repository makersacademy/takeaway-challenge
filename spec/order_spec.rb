require './lib/order.rb'

describe Order do

  context '#initialize' do
    it 'should initialize with a empty hash as the order' do
      expect(Order.new.current_order).to be_an_instance_of(Hash)
    end
  end

  context '#show_menu' do
    it 'should show the menu of the restuarnt' do
      order = Order.new
      expect(order.show_menu).to be_an_instance_of(Hash)
    end

    it 'should default as the menu of the takeaway' do
      order = Order.new
      takeaway = Takeaway.new
      expect(order.show_menu).to eq takeaway.menu
    end
  end

  context '#show_current_order' do
    it 'should show the show current order when called' do
      order = Order.new
      expect(order.show_current_order).to eq order.current_order
    end
  end

  context '#add' do
    it 'should add the food and quanity to the order' do
      order = Order.new
      order.add('chicken', 2)
      expect(order.show_current_order).to eq({ "chicken" => 2 })
    end
    it 'should raise an error if the food is not on the menu' do
      order = Order.new
      expect { order.add('pizza',1) }.to raise_error("Select a item from the menu")
    end
    it 'should default with quanity as one' do
      order = Order.new
      order.add('chicken')
      expect(order.show_current_order).to eq({ "chicken" => 1 })
    end
  end

  context '#on_menu' do
    it 'should return true if the food is on the menu' do
      order = Order.new
      expect(order.on_menu('chicken')).to be true
    end

    it 'should return false if the food is not on the menu' do
      order = Order.new
      expect(order.on_menu('pizza')).to be false
    end
  end
end
