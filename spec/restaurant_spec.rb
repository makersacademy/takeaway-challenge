require 'restaurant.rb'

describe Restaurant do

  describe '#show_menu' do
    let(:menu) { double :menu }

    before do
      allow(menu).to receive(:to_s).and_return("Malt Loaf Rarebit: £10\nAlfio's Affogato: £8")
    end

    it 'shows menu' do

      restaurant = Restaurant.new(menu)

      expect(restaurant.show_menu).to eq("Welcome to #{Restaurant::RESTAURANT_NAME}\n\nThis is our menu:\n\nMalt Loaf Rarebit: £10\nAlfio's Affogato: £8\nWhat would you like to order?")
    end
  end
end
