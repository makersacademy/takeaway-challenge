require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  describe "#initialize" do
    context "returns a list of dishes with prices" do
      it "returns the dish name of the first dish" do
      expect(menu.dishes[0][:dish_name]).to eq "mushroom risotto"
      end
      it "returns the price of the second dish" do
      expect(menu.dishes[1][:price]).to eq 4
      end
    end
  end
end
