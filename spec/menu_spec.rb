require 'menu'
require 'byebug'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish1) { double(:dish1, name: dish1_name, price: dish1_price) }
  let(:dish1_name) { :cereal }
  let(:dish1_price) { 2.3 }
  let(:dish2) { double(:dish1, name: dish2_name, price: dish2_price) }
  let(:dish2_name) { :cofee }
  let(:dish2_price) { 1.3 }

  describe '#add_dish' do
    it 'should had dish to the menu' do
      allow(menu).to receive(:create_dish) { dish1 }
      menu.add_dish(dish1_name,dish1_price)
      expect(menu.list).to include(dish1)
    end
  end

  describe '#display' do
    it 'should display name of each dish with its price as a hash' do
      allow(menu).to receive(:create_dish) { dish1 }
      menu.add_dish(dish1_name,dish1_price)
      allow(menu).to receive(:create_dish) { dish2 }
      menu.add_dish(dish2_name,dish2_price)
      expect(menu.display).to eq({dish1_name => dish1_price, dish2_name => dish2_price})
    end
  end

  describe '#list' do
    it 'has the array of dishes' do
    expect(menu.list).to be_a(Array)
    end
  end
end
