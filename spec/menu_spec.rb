require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  describe ".new dishes" do
    it "equals an empty hash" do
      expect(menu.dishes).to eq([])
    end
  end

  describe "#add_dish" do

    it "adds new dishes to dishes array" do
      new_dish = "Salmon"
      menu.add_dish(new_dish)
      expect(menu.add_dish(new_dish)).to eq(new_dish)
    end
  end
end
