require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new(menu_dbl) }
  let(:menu_dbl) { double('menu', format: 'formatted menu', find_dish: dish_dbl) }
  let(:dish_dbl) { double('dish') }

  it 'stores the given menu' do
    expect(restaurant).to have_attributes(:menu => menu_dbl)
  end

  describe '#format_menu' do
    it "sends a format message to the restaurant's @menu" do
      expect(menu_dbl).to receive(:format).once
      restaurant.format_menu
    end

    it 'returns the formatted menu received from @menu' do
      expect(restaurant.format_menu).to eq(menu_dbl.format)
    end
  end

  describe '#find_dish(dish_name)' do
    it 'takes a dish name as an argument' do
      expect(restaurant).to respond_to(:find_dish).with(1).argument
    end

    it 'sends a find_dish message to the menu with the dish_name' do
      expect(menu_dbl).to receive(:find_dish).once.with('Pepperoni pizza')

      restaurant.find_dish('Pepperoni pizza')
    end

    it 'returns the dish object received from menu.find_dish' do
      expect(restaurant.find_dish('Pepperoni pizza')).to eq(menu_dbl.find_dish)
    end
  end
end
