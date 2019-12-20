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

  it "creates and instance of Menu" do
    menu = Menu.new
    expect(menu).to be_a Menu
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end
end
