require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      hotdog: 5.00,
      fries: 3.50,
      drink: 2.99
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Hotdog £5.00, Fries £3.50, Drink £2.99"
    expect(menu.print).to eq(printed_menu)
  end
  
end
