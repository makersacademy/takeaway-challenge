require 'menu'
describe Menu do
  subject(:menu) {described_class.new}

  describe '#dishes' do
    it 'contains dishes' do
      expect(menu).to respond_to(:dishes)
    end
    it 'includes the dishes with prices' do
      dishes = {'Chicken Jalfrezi': 5.99,
                'Chicken Tikka': 4.99,
                'Chicken Balti': 5.49,
                'Butter Chicken': 12,
                'Naan Bread': 1}

      expect(menu.dishes).to include dishes
    end
  end
end
