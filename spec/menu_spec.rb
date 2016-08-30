require 'menu'
describe Menu do
  subject(:menu) {described_class.new}

  describe '#dishes' do
    it 'contains dishes' do
      expect(menu).to respond_to(:dishes)
    end
    it 'includes the dishes with prices' do
      dishes = Menu::DISHES
      expect(menu.dishes).to include dishes
    end
    it 'calculates the price of the dishes' do
      dishes = { "Jalfrezi" => 5.99, "Naan" => 1 }
      expect(menu.price("Naan")).to eq(dishes["Naan"])
    end
  end
end
