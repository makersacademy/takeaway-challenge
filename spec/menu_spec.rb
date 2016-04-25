require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { {"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3} }
  
  describe '#initialize' do
    it "has a list of dishes" do
      expect(menu.dishes).to eq dishes
    end
  end
  
  describe '#contains?' do
    it "confirms if dish is on the menu" do
      expect(menu.contains?("Fish")).to be false
    end
  end
  
  describe "#read_menu" do
    it "prints the menu in a user friendly way" do
      printed_menu = "Chicken: £4.50\nPork: £5.50\nSteak: £9.30"
      expect(menu.read_menu).to eq printed_menu
    end
  end
end