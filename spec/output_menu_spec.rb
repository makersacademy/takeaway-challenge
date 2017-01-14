require "output_menu"

describe Output_Menu do
  subject(:output_menu) {described_class.new}

  it "Outputs a menu" do
    menu = [{item: "Test Item", price: 1.50}]
    expect(output_menu.display(menu)).to eq menu
  end
end
