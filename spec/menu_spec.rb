require 'menu'
require 'dish'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) {double :dish}
  let(:dish2) {double :dish}

  describe '#creating a new menu' do
    it 'initializes with an empty array of dishes' do
      expect(menu.dishes).to be_empty
    end
  end

  describe '#adding dishes to the menu' do
    before do
      menu.add_dish(dish)
      menu.add_dish(dish2)
    end

    it 'adds dishes to the menu' do
      expect(menu.dishes[0]).to eq(dish)
    end

    it 'adds multiple dishes to the menu' do
      expect((menu.dishes).length).to eq 2
    end
  end

  describe '#printing the menu' do
    it 'prints a list of dishes with prices' do
      menu.add_dish(dish)
      menu.add_dish(dish2)
      expect(menu.print_menu).to eq menu.dishes
    end

    it 'raises an error if menu is empty' do
      message = "There are no dishes on the menu"
      expect{ menu.print_menu }.to raise_error message
    end
  end
end
