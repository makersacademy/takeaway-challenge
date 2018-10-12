require "menu"

describe Menu do

  subject(:menu) { described_class.new }

  it "displays the list of items and prices" do
    expect(menu).to respond_to(:view)
  end

  it "returns items and prices" do
    expect{ menu.view }.to output("Burger = £3\nHotdog = £2\n").to_stdout
  end
end
