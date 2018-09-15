require './lib/menu'
describe Menu do
  subject(:menu) { described_class.new }
  describe '#initialize' do
    it 'creates a menu with dishes and prices' do
      expect(menu.menu_list).to be_an_instance_of(Hash)
    end
    it 'contains dishes and prices' do
      expect(menu.menu_list[:coke]).to eq 2.5
    end
  end
  describe '#display_menu' do
    it 'displays the menu in a readable way' do
      expect{ menu.display_menu }.to output("\"Dish: tortilla, price: £4\"\n\"Dish: gazpacho, price: £3\"\n\"Dish: pasta, price: £5\"\n\"Dish: pizza, price: £5\"\n\"Dish: lasagna, price: £5.5\"\n\"Dish: salad, price: £4\"\n\"Dish: coke, price: £2.5\"\n").to_stdout
    end
  end
end
