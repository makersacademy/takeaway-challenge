require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) { {chicken: 5.00, kebab: 2.00} }

  it "Has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "Prints a list of dishes with their prices" do
    printed_menu = "Chicken: £5.00, Kebab: £2.00"
    expect(menu.print).to eq(printed_menu)
  end

end
