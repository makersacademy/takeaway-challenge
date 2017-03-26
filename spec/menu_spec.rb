require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "so that I can see a list of dishes with prices, initialize menu with dishes" do
      dishes = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
        expect(menu.dishes).to eq dishes
    end
  end

  describe "#read_menu" do
    it "So that I can check if I want to order something, check read_menu returns the dishes" do
      dishes = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
        expect(menu.read_menu).to eq dishes
      end
    end
  end
