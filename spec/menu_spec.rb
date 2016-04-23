require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish1) { double(:Dish, name: "Chicken", price: 1) }
  let(:dish2) { double(:Dish, name: "Fish", price: 2) }
  let(:dish3) { double(:Dish, name: "Steak", price: 3) }

  describe '#add' do
    it 'adds a dish to the menu' do
      expect{ menu.add dish1 }.to change { menu.dishes }.to include dish1
    end
  end

  describe '#display' do
    it 'displays all menu items' do
      menu.add dish1
      expect(menu.display).to include dish1.name
    end
  end
end
