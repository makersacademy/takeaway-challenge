require 'menu'

describe Menu do
  subject(:menu){ described_class.new}

  describe '#initialize' do
    it 'creates a new hash with dishes' do
      expect(menu.dishes.empty?).to be false
    end
  end

  describe '#read' do
    # it 'returns the menu' do
    #   expect(menu.read).to eq menu.dishes
    # end

    it 'cannot override the menu' do
      menu.dishes[:ham_hock] = 2
      expect(menu.dishes[:ham_hock]).not_to be 2
    end

    #TODO it 'shows the name of a dish' do

    #end
    #TODO it 'shows the price of a dish' do

    #end
  end
end
