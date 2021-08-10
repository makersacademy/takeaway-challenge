require 'menu'

describe Menu do

  items = [{"Chicken burger" => 10}, {"Vegan Soup" => 5}, { "Chang Beer" => 3}]
  let(:menu) { described_class.new(items) }

    describe "#initialize" do
      it "includes 'Chang' string" do
        expect {menu.show_menu}.to output(/#{Regexp.quote("Chang")}/).to_stdout

      end

      it "includes price of chicken burger" do
        expect {menu.show_menu}.to output(/#{Regexp.quote("10")}/).to_stdout
      end

      it "includes 'vegan' item" do
        expect {menu.show_menu}.to output(/#{Regexp.quote("Vegan")}/).to_stdout
      end
    end
end