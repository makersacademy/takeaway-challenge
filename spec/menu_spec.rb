require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do
    {
      pizza: 12.50,
      burger: 7.50
    }
  end

  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Pizza £12.50, Burger £7.50"
    expect(menu.print).to eq(printed_menu)

  end


end
