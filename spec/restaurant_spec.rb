require 'restaurant'

describe Restaurant do

  describe 'Creating a new restaurant' do
    it 'initializes with a name' do
      restaurant = Restaurant.new('cafe')
      expect(restaurant.name).to eq 'cafe'
    end
  end

  describe 'adding menu items' do
    it 'can add a menu item' do
      mock_menu = double ('menu')
      restaurant = Restaurant.new('cafe', mock_menu)
      message = 'added cake'
      expect(mock_menu).to receive(:add_item).with('cake', 6).and_return message
      restaurant.add_menu_item('cake', 6)
    end

  end

end
