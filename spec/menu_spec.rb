require 'menu'

describe Menu do
  subject(:menu) { described_class.new([]) }

  describe '#add_dish' do
    it 'adds dish to dishes' do
      expect{ menu.add_dish("Chickenburger", 5) }.to change { menu.dishes.count }.from(0).to(1)
    end
  end
end
