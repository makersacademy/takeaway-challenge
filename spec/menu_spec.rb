require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pak_tod: 4.90,
      satay_gai: 5.50,
      pad_thai: 7.90,
    }
  end

  it "contains a list of dishes with their prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Pak Tod: £4.90, Satay Gai: £5.50, Pad Thai: £7.90"
    expect(menu.print).to eq(printed_menu)
  end
  
end