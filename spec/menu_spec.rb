require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { {"Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3} }
  
  describe '#add_dish' do
    it "adds a dish to the menu" do
      menu.add_dish("Fish", 10)
      expect(menu.contains?("Fish")).to be true
    end
  end
  
  describe '#remove_dish' do
    it "removes a dish from the menu" do
      menu.remove_dish("Pork")
      expect(menu.contains?("Pork")).to be false
    end
  end
  
  describe "#read" do
    it "prints the menu in a user friendly way" do
      printed_menu = "Chicken: £4.50\nPork: £5.50\nSteak: £9.30"
      expect(menu.read_menu).to eq printed_menu
    end
  end
end