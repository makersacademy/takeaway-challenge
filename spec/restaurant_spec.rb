require 'restaurant'

describe Restaurant do

  describe 'named cafe' do


    before(:each) do
      @mock_menu = double ('menu')
      @restaurant = Restaurant.new('cafe', @mock_menu)
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
      it 'prints out the menu' do
        message = "Slice of Cake - £6.00"
        allow(@mock_menu).to receive(:add_item)
        allow(@mock_menu).to receive(:print_menu).and_return message
        @restaurant.add_menu_item('cake', 6)
        expect(@restaurant.view_menu).to eq("Slice of Cake - £6.00")
      end
    end
  end
end
