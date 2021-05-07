require 'Order.rb'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double() }

  context '#add_dish' do
    it 'stores selected dishes and quantities' do
      order.add_dish("Pizza", 2)
      expect(order.dishes).to include({ :name => "Pizza", :amount => 2 })
    end

    it 'raises an error if the dish isnt on the menu' do
      message = "This disnt isn't available, please run menu.list_dishes to see the dishes"
      expect { order.add_dish("Potatoes", 1) }.to raise_error message 
    end
  end
end
