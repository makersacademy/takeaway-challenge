require 'menu'

RSpec.describe Menu do

  let(:menu) { Menu.new }
  let(:option_1) { double :dish, name: "Chicken Katsu Curry", price: 6 }
  let(:option_2) { double :dish, name: "Sweet & Sour Chicken", price: 6 }
  let(:option_3) { double :dish, name: "Kung Pao Chicken", price: 6 }
  let(:option_4) { double :dish, name: "Chow Mein", price: 4 }
  let(:option_5) { double :dish, name: "Egg-Fried Rice", price: 3 }


  describe "#add" do

    it "should return a confirmation message for every dish has been added to the menu" do
      expect(menu.add(option_1)).to eq "Chicken Katsu Curry has been added to the menu"
    end

    it "should raise an error if the dish is already in the menu" do
      message = "Chicken Katsu Curry is already in the menu"
      menu.add(option_1)
      expect { menu.add(option_1) }.to raise_error message
    end
  end

  describe "#list" do
    it "should return an empty string if there are no dishes in the menu" do
      expect(menu.list).to eq ""
    end

    it "should return the list of dishes" do
      menu.add(option_1)
      menu.add(option_2)
      expect(menu.list).to eq "Chicken Katsu Curry £6, \n Sweet & Sour Chicken £6"
    end
  end

  describe "#contains?" do
    it "should return true if the dish is in the menu" do
      menu.add(option_1)
      expect(menu.contains?(option_1)).to eq true
    end

    it "should return false if the dish is not in the menu" do
      menu.add(option_3)
      expect(menu.contains?(option_1)).to eq false
    end
  end
end