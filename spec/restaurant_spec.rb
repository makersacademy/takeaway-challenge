require 'restaurant'

describe Restaurant do

  describe 'named cafe' do

    before(:each) do
      @mock_menu = double 'menu'
      @order = double 'Order'
      @restaurant = Restaurant.new('cafe', @mock_menu, @order)
    end

    it 'initializes with a name' do
      expect(@restaurant.name).to eq 'cafe'
    end

    describe '#add_menu_item' do
      it 'can add a menu item' do
        message = 'added cake'
        expect(@mock_menu).to receive(:add_item).with('cake', 6).and_return message
        @restaurant.add_menu_item('cake', 6)
      end

    end

    describe '#view menu' do
      it 'calls on menu to print' do
        expect(@mock_menu).to receive(:print_menu)
        @restaurant.view_menu
      end
      it 'returns a string of menu items' do
        message = "Slice of Cake - £6.00"
        allow(@mock_menu).to receive(:add_item)
        allow(@mock_menu).to receive(:print_menu).and_return message
        @restaurant.add_menu_item('cake', 6)
        expect(@restaurant.view_menu).to eq("Slice of Cake - £6.00")
      end
    end

    describe '#create_new_order' do
      it 'creates a new instance of Order' do
        expect(@order).to receive(:new).and_return self
        @restaurant.create_new_order
      end
    end

    describe '#add_to_order' do
      it 'returns confirmation of item added' do
        order_mock = double 'order'
        item_mock = double 'item'
        allow(@mock_menu).to receive(:get).and_return(item_mock)
        allow(@order).to receive(:new).and_return order_mock
        allow(order_mock).to receive(:add_item).and_return('added 2 cake(s)')
        @restaurant.create_new_order
        expect(@restaurant.add_to_order('cake', 2)).to eq('added 2 cake(s)')
      end
    end

    describe '#view_order' do
      it 'calls for printed order' do
        order_mock = double 'order'
        allow(@order).to receive(:new).and_return order_mock
        @restaurant.create_new_order
        expect(order_mock).to receive(:print_order)
        @restaurant.view_order
      end
    end

    describe '#verify_total' do
      it 'calls on order to return total' do
        order_mock = double 'order'
        allow(@order).to receive(:new).and_return order_mock
        @restaurant.create_new_order
        expect(order_mock).to receive(:total)
        @restaurant.verify_total
      end
    end
  end
end
