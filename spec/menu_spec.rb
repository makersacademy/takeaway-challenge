require 'menu'
describe Menu do
  subject(:menu) { described_class.new }

  describe 'altering the menu' do
    let(:dish) { double(:dish) }
    let(:price) { double(:price) }
    before do
      menu.add(dish, price)
    end

    it 'allow you to add the dishes' do
      expect(menu.dishes).to include({ dish => price })
    end

    it 'allow you to delete the dishes' do
      menu.delete(dish)
      expect(menu.dishes).not_to include({ dish => price })
    end
  end
end
