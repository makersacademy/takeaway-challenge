require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
  {
    Pizza: 19.50, 
    Falafel: 9.00
  }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq (dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Pizza: £19.50, Falafel: £9.00"
    expect(menu.print).to eq(printed_menu)
  end

  it 'tells if a dish is on the menu' do
    expect(menu.has_dish?(:Pizza)).to be true
  end

  it 'tells if a dish is not on the menu' do
    expect(menu.has_dish?(:Chicken)).to be false
  end

end