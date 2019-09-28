require 'menu'

describe Menu do

  subject(:menu) { described_class.new(items) }

  let(:items) do
    { hamburger: 5.00, cheeseburger: 6.00, fries: 2.00 }
  end

  it "stores a list of menu items and prices" do
    expect(menu.items).to eq items
  end

  it "prints the items in the menu" do
    printed_menu = "Hamburger £5.00, Cheeseburger £6.00, Fries £2.00"
    expect(menu.print).to eq printed_menu
  end
end
