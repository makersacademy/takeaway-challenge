require "menu"
describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      spaghetti_lobster: 30.00,
      salmon_tartare: 15.00,
    }
  end
  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Spaghetti Lobster £30.00, Salmon Tartare £15.00"
    expect(menu.print).to eq(printed_menu)
  end

end
