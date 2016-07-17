require "menu"
describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do { wonton: 2.0, chowmein: 3.5 } end


  it "has a list of items and their prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "Prints a list of items and their prices" do
    printed_menu = "Wonton £2.00, Chowmein £3.50"
    expect(menu.print_dishes).to eq printed_menu
  end
end
