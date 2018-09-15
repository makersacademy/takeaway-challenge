require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#dishes' do
    it 'should be stored in an array' do
      expect(menu).to receive(:dishes).and_return Array
      menu.dishes
    end
    it 'should contain one or more dishes' do
      expect(menu.dishes.length).to be >= 1
    end
  end
end
