require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#view" do
    let(:stubbed_items) do
      {
        "burger" => {
          name: "burger",
          price: 10.00
        },
        "cheese burger" => {
          name: "cheese burger",
          price: 11.00
        },
      }
    end

    it "displays the formatted menu" do
      stub_const("Menu::ITEMS", stubbed_items)
      expect { menu.view }.to output { "burger 10.0\n cheese burger 11.0" }.to_stdout
    end
  end

  describe "#dish_available?" do
    it "returns false if dish is not in the menu" do
      expect(menu.dish_available?("pizza")).to eq false
    end

    it "returns true if dish is in the menu" do
      expect(menu.dish_available?("burger")).to eq true
    end
  end

  describe "#dish_price" do
    it "returns the dish price" do
      expect(menu.dish_price("burger")).to eq 10.0
    end
  end

end
