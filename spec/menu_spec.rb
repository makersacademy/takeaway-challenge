require 'menu'

describe Menu do

  items = {
    "Chicken burger" => 10,
    "Vegan Soup" => 5,
    "Chang Beer" => 3,
  }

  subject(:menu) { described_class.new(items) }

    describe "#initialize" do
      it "returns correct length of menu" do
        expect(menu.items.length).to eq 3
      end

      it "returns correct first item" do
        expect(menu.items.keys).to eq ["Chicken burger", "Vegan Soup", "Chang Beer"]
      end

      it "returns correct value for given key" do
        expect(menu.items["Chicken burger"]).to eq 10
      end
    end 
end