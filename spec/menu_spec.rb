require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      chicken: 4,
      falafel: 25
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "chicken £4.00, falafel £25.00"
    expect(menu.print).to eq(printed_menu)
  end
end
