require 'byebug'
require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double(:dish) }

  context 'when building a menu' do
    it 'adds an item to the menu' do
      menu.add('Chicken', 12)
      expect( menu.show ).to include chicken: 12
    end
  end
  context 'menu management' do
    it 'verifies an item is on the menu' do
      menu.add('Chicken', 12)
      expect(menu.on_menu?('Chicken')).to be true
    end
  end
end

# NEED HELP AND RESEARCH ON
# how to properly specify and use doubles... here add_item in creating a real dish instance. should this be a double?
