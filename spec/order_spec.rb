require_relative '../lib/order.rb'
require_relative '../lib/menu.rb'

describe Order do

  attr_reader :menu, :order

  before :each do
    @menu = Menu.new
    @menu.add_item('Fish and chips', 3.20)
    @order = Order.new(menu)
  end

  describe '#initialize' do
    context 'accepts menu as argument when new instance is created' do
      let(:restaurant) { double("Restaurant") }
      it 'raises an error if argument is not an instance of Menu class' do
        expect { Order.new(restaurant) }.to raise_error('Please provide a valid menu!')
      end
      it 'raises an error if menu has no items' do
        expect { Order.new(Menu.new) }.to raise_error('The menu you have provided has no items!')
      end
    end
  end

  describe '.place_order' do
    context 'asks user for order details' do
      it 'asks user to input name of dish' do
        # expect { order.place_order }.to \
        # output("Which dish would you like to order?\n").to_stdout
      end
      it 'accepts name of dish from user' do

      end
      it 'raises error if dish name does not exist in menu items' do

      end
      it 'asks user to input quantity of dish' do

      end
      it 'accepts quantity of dish from user' do

      end
    end
  end
end
