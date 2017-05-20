require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }

  describe '#add_dish' do
    it 'adds a dish to the dishes list' do
      expect(menu.add_dish(dish)).to eq [dish]
    end
  end

  describe '#read_menu' do
    before do
      allow(dish).to receive(:name) { 'wings' }
      allow(dish).to receive(:price) { 7 }
    end

    it 'show all the dishes in the menu' do
      menu.add_dish(dish)
      expect(menu.read_menu).to eq('1. wings, £7.00')
    end
  end
end
