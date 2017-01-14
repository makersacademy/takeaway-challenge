require 'menu'
require 'dish'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) {double :dish}
  let(:dish2) {double :dish}

  describe '#creating_a_new_menu' do
    it 'initializes with an empty array of dishes' do
      expect(menu.dishes).to be_empty
    end
  end

  describe '#adding_dishes_to_the_menu' do
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

  describe '#printing_the_menu' do
    before do
      menu.add_dish(dish)
      menu.add_dish(dish2)
    end

    it 'prints a list of dishes with prices' do
      expect(menu.print_menu).to eq menu.dishes
    end

  end
end
