require "menu"

describe Menu do

  let(:menu) {described_class.new(items)}
  let(:items) do {

    burger: 1.99,
    chips: 1.00,
  }
  end

  it "has a list of items and their prices" do
    expect(menu.items).to eq (items)
  end

  it "prints a menu with items and prices"do
    printed_menu = "Burger £1.99, Chips £1.00"
    expect(menu.show).to eq (printed_menu)
  end
end
