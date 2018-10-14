require 'mainmenu'

describe MainMenu do

  subject(:mainmenu) { described_class.new }

  it "displays the header" do
    expect(subject.print_header).to eq(nil)
  end

  it "displays the full menu" do
    expect(subject.view_menu).to include("1. Chips Price £1.00")
  end

  it "returns the place_order method" do
    expect(subject.place_order).to eq(nil)
  end

  it "returns the front menu" do
    expect(subject.front_menu).to eq(nil)
  end

end
