require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { {"Chicken" => 10} }
  
  describe '#add_dish' do
    it "adds a dish to the menu" do
      menu.add_dish(name: "Chicken", price: 10)
      expect(menu.dishes).to include dish
    end
  end
  
  describe '#remove_dish' do
    it "removes a dish from the menu" do
      menu.add_dish(name: "Chicken", price: 10)
      menu.remove_dish("Chicken")
      expect(menu.dishes).not_to include dish
    end
  end
end