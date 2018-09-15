require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#dishes' do
    it 'should be stored in an array' do
      expect(menu).to receive(:dishes).and_return Array
      menu.dishes
    end
    it 'should contain one or more items' do
      expect(menu.dishes.length).to be >= 1
    end
    it 'should contain dishes with names' do
      first_dish = menu.dishes.first
      expect(first_dish.name).to be_a(String)
    end
    it 'should contain dishes with prices' do
      first_dish = menu.dishes.first
      expect(first_dish.price).to be_a(Float)
    end
  end
end
