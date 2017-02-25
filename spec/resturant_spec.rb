require 'resturant'
describe Resturant do

  subject(:resturant) {described_class.new}

  context "#show_menu" do
    it "displays a list of dishes and prices" do
      expect(resturant.show_menu).to eq [{name: :lamp_chops, price: 7.0},{name: :chicken_karahi, price: 7.5},{name: :naan, price: 2.95}]
    end
  end

  context "#choose" do
    it "allows customer to choose dishes" do
      expect(resturant).to respond_to(:choose).with(1).argument
    end
  end
end
