require 'menu'

describe Menu do
subject(:menu) { described_class.new }
let(:item) { double :'Olives' }
let(:price) { double :'3'}
# let(:listed) {double "Risotto, £5.5\nCarbonara, £6.5\nBolognese, £6\nCalzone, £6\nPizza, £7\nCoke, £2"}
  describe '#show' do
    it 'displays menu' do
      expect(menu.show).to eq menu.list
    end
  end

  describe '#add' do
    let(:price2) { double :'2.5'}

    it 'adds an item to the menu' do
      menu.add(item, price)
      expect(menu.list.include?(item)).to be true
    end

    it 'changes an item price on menu' do
      menu.add(item, price)
      menu.add(item, price2)
      expect(menu.list[item]).to eq price2
    end
  end

  describe '#remove' do
    it 'removes an item from menu' do
      menu.add(item, price)
      menu.remove(item)
      expect(menu.list[item]).to be nil
    end
  end
end
