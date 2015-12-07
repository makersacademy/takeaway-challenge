require 'menu'

describe Menu do

  let(:dish_name) { "Beef" }
  let(:dish) { { name: "Beef", price: 7} }
  subject(:menu) { described_class.new }

  describe '#view' do
    it 'returns a full list of dishes with prices' do
      expect(menu.view).to start_with("// MENU //")
    end
  end

  describe '#find' do
    it 'returns the selected dish with its price and quantity' do
      expect(menu.find(dish_name)).to eq dish
    end

    it 'raises an error if the dish douesn\'t exist' do
      expect { menu.find("Pizza") }.to raise_error "Not in the menu!"
    end
  end
end
