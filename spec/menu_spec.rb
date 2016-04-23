require 'menu'

describe Menu do
subject(:menu) { described_class.new }
let(:item) { double 'Olives' }
let(:price) { double :'3'}
let(:list) { {'Carbonara' => 6.5,'Pizza' => 7, 'Coke' => 2} }

  describe '#show' do
    it 'displays menu' do
    expect(menu.show).to eq list
    end
  end

  describe '#add' do
    let(:price2) { double :'2.5'}

    it 'adds an item to the menu' do
      menu.add(item, price)
      expect(menu.show.include?(item)).to be true
    end

    it 'changes an item price on menu' do
      menu.add(item, price)
      menu.add(item, price2)
      expect(menu.show[item]).to eq price2
    end
  end

  describe '#remove' do
    it 'removes an item from menu' do
      menu.add(item, price)
      menu.remove(item)
      expect(menu.show[item]).to be nil
    end
  end
end
