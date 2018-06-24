require './lib/takeaway'
require './lib/menu'

describe Takeaway do
  let(:menu) { double Menu.new }

  describe 'print_menu' do
    it 'prints menu on inititalize' do
      allow(menu).to receive(:price_list).and_return('a menu')
      takeaway = Takeaway.new(menu)
      expect(takeaway.print_menu).to eq('a menu')
    end
  end

  describe '#add_to_basket' do
    it 'adds the customers choice to the basket' do
      allow(menu).to receive(:price_list).and_return('a menu')
      takeaway = Takeaway.new(menu)
      expect(takeaway.add_to_basket(:pork, 2)).to eq('pork burrito x 2 added')
    end
  end
end
