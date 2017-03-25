require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:item) { double :item }

  describe '#initialize' do
    it 'has dishes' do
      expect(menu.dishes).to include "Hamburger"
    end
  end

  describe '#does_not_contain?' do
    it 'returns true if item not in dishes' do
      expect(menu.does_not_contain?(:item)).to eq true
    end
  end
end
