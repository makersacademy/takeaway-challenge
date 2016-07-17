require 'menu'

describe Menu do

subject(:menu) { described_class.new(dishes) }

let(:dishes) do
{
  Chicken: 3.50,
  Fries: 5.50,
  Bikini: 2.44
}

end

  it "contains the dishes with correspoding prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it 'puts the list of dishes with correspoding prices' do
    printed_menu = "Chicken: £3.50, Fries: £5.50, Bikini: £2.44"
    expect(menu.print_this).to eq(printed_menu)
  end

  it 'has the item on the menu' do
    expect(menu.has_dish?(:Chicken)).to be(true)
  end

  it 'has not the item on the menu' do
    expect(menu.has_dish?(:Bananas)).to be(false)
  end



end
