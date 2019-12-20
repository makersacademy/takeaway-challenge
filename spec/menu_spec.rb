require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      rice: 2.50,
      fish: 5.00,
      chips: 3.00
    }
  end

  it "creates an instance of Menu" do
    expect(menu).to be_a Menu
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end
  it "prints the list of dishes with prices" do
    printed_dishes_with_prices = "rice £2.50, fish £5.00, chips £3.00"
    expect(menu.print).to eq (printed_dishes_with_prices)

  end
end
