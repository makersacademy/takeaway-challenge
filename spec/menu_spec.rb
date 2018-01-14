require 'rspec'
require 'menu'

describe Menu do
  subject(:menu) { described_class.new("Breakfast Menu") }
  let (:dish) { double :dish }

  context '#initialize' do
    it 'has a name' do
      expect(menu.name).to eq "Breakfast Menu"
    end

    it 'is empty on initialize' do
      expect(menu.dishes).to be_empty
    end
  end

  context '#add' do
    it 'adds a dish to menu' do
      menu.add(dish)
      expect(menu.dishes).to contain_exactly(dish)
    end

    it 'adds two dishes to menu' do
      menu.add(dish)
      menu.add(dish2 = double)
      expect(menu.dishes).to contain_exactly(dish, dish2)
    end
  end

  context '#remove' do
    let(:dish2) { double :dish2 }

    before do
      menu.add(dish)
      menu.add(dish2)
      menu.remove(dish)
    end

    it 'removes a dish from the menu' do
      expect(menu.dishes).not_to contain_exactly(dish)
    end

    it 'does not remove other dishes' do
      expect(menu.dishes).to contain_exactly(dish2)
    end
  end
end
