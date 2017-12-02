require 'restaurant.rb'
describe Restaurant do
  context 'menu' do
    it 'when called the menu should appear' do
      restaurant = Restaurant.new
      expect(restaurant.show_menu).to eq []
    end
  end
end
