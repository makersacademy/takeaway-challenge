require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new }

  describe '#initialize' do
    it 'initializes with a menu available to customers' do
      expect(restaurant).to respond_to(:menu)
    end
  end

  describe '#show_menu' do
    it 'lets customers see the menu' do
      expect(restaurant.show_menu).to eq(restaurant.menu)
    end
  end

end
