require './lib/menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      Burger: 5.00,
      Chips: 1.50,
      Chicken: 2.00
    }
  end

  it "contains a list of dishes and prices" do
    expect(menu.dishes).to eq dishes
  end

  it "shows a list of dishes with prices" do
    printed_menu = "Burger £5.00, Chips £1.50, Chicken £2.00"
    expect(menu.show).to eq printed_menu
  end

end
