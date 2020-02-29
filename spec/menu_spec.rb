require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#view" do
    it { is_expected.to respond_to(:view) }

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

end
