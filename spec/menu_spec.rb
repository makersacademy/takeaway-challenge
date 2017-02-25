require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  context "#initialize" do
    it "with an array of dishes and its price information" do
      expect(menu.dishes).to_not be_empty
    end
  end

  context "#dishes" do

    it "returns a list of dishes" do
      expect(menu).to receive(:dishes)
      menu.dishes
    end

  end
end
