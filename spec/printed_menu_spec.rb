require 'printed_menu'

describe PrintedMenu do

  it "has a list of items and prices" do
    expect(subject.print_printed_menu).to eq("Water" => 3, "Tea" => 4, "Coffee" => 2)
  end

  it "prints the menu out nicely" do
    expect(subject.print_nicely).to eq "Water: £3, Tea: £4, Coffee: £2"
  end
end
