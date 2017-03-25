require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'has dishes' do
      expect(menu.dishes).to include "Hamburger"
    end
  end
end
