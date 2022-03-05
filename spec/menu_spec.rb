require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double(:dish_double, :name => 'Pizza', :price => 16 ) }

  describe '#add_dish' do
    it 'updates the list of items' do
      expect(menu.add_dish(dish)).to include(dish)
    end
  end

  describe '#list_dishes' do
    it 'returns a formatted list of dishes' do
      menu.add_dish(dish)
      expect { menu.list_dishes }.to output("1. Pizza - 16\n").to_stdout
    end
  end
end