require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#initialize' do
    it 'has a menu' do
      expect(menu.dishes).to be_truthy
    end
  end

end
