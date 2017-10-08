require 'menu'

describe Menu do
  let(:order) { double(:order, :add => true) }
  subject(:menu) { described_class.new order}
  describe '#initialize' do
    it 'takes an Order object as an argument and stores it in the order instance variable' do
      expect(menu.order).to eq order
    end
    it 'adds a Dish object to the menu.dishes array' do
      expect(menu.dishes[0]).to be_a Dish
    end
    it 'adds adds the right number of objects to the menu.dishes array' do
      expect(menu.dishes.length).to eq Menu::DISHES.length
    end
  end
  describe '#show' do
    it 'enables users to see everything on the menu' do
      menu_text = menu.show
      Menu::DISHES.each do |dish_array|
        expect(menu_text).to include dish_array[0]
      end
    end
  end
end
