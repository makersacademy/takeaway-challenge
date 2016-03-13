require 'menu'
require 'byebug'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish1) { double(:dish1, name: dish1_name, price: dish1_price) }
  let(:dish1_name) { :cereal }
  let(:dish1_price) { 2.3 }

  describe '#add_dish' do
    it 'should had dish to the menu' do
      allow(menu).to receive(:create_dish) { dish1 }
      menu.add_dish(dish1_name,dish1_price)
      expect(menu.list).to include(dish1)
    end
  end

  describe '#display' do
    it 'should display name of each dish with its price' do
      allow(menu).to receive(:create_dish) { dish1 }
      menu.add_dish(dish1_name,dish1_price)
      expect(menu.display).to include({dish1_name => dish1_price})
    end
  end
end
