require 'menu'

describe Menu do

  items = [{"Chicken burger" => 10}, {"Vegan Soup" => 5}, { "Chang Beer" => 3}]
  let(:menu) { described_class.new(items) }

    describe "#initialize" do
      it "returns correct length of menu" do
        expect(menu.show_menu.length).to eq 3
      end

      it "returns correct first item" do
        expect(menu.show_menu.last.keys.first).to eq "Chang Beer"
      end

      it "returns correct value for given key" do
        expect(menu.show_menu.first["Chicken burger"]).to eq 10
      end
    end
end