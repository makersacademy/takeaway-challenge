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

    it 'show the dishes in the menu' do
      menu.add_dish(dish)
      expect(menu.show_menu).to eq('1. wings, £7.00')
    end
  end

  describe '#select_dish' do
    before do
      allow(dish).to receive(:name) { 'wings' }
      allow(dish).to receive(:price) { 7 }
    end

    context 'if the dish is on the menu' do
      before(:each) { menu.add_dish(dish) }

      it 'allows to select a dish from the menu' do
        expect(menu.select_dish('wings')).to eq({ name: dish.name, price: dish.price })
      end
    end

    context 'if the dish is not on the menu' do
      it 'tells the user that the dish is not on the menu' do
        expect { menu.select_dish('wings') }.to raise_error 'wings is not on the menu'
      end
    end
  end

end
