require './lib/menu'
describe Menu do
  subject(:menu) { described_class.new }
  describe '#initialize' do
    it 'creates a menu with dishes and prices' do
      expect(menu.menu_list).to be_an_instance_of(Hash)
    end
    it 'contains dishes and prices' do
      expect(menu.menu_list[:coke]).to eq 2
    end
  end

  describe '#display_menu' do
    it 'displays the menu in a readable way' do
      expect { menu.display_menu }.to output("\"Dish: tortilla, price: £4\"\n\"Dish: gazpacho, price: £3\"\n\"Dish: pasta, price: £5\"\n\"Dish: pizza, price: £5\"\n\"Dish: lasagna, price: £6\"\n\"Dish: salad, price: £4\"\n\"Dish: coke, price: £2\"\n").to_stdout
    end
  end

  describe '#dish_included?' do
    it 'returns true if a dish is in the menu' do
      expect(menu.dish_included?(:tortilla)).to eq true
    end
    it 'returns false if a dish is not in the menu' do
      expect(menu.dish_included?(:fanta)).to eq false
    end
  end

  describe '#dish_price' do
    it 'gives the price of a specific dish' do
      expect(menu.dish_price(:lasagna)).to eq 6
    end
  end
end
