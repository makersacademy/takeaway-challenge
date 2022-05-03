require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) { {
    "Prawn Toast": 5.5,
    "Siu Mai": 4.0,
    "Singapore Vermicelli": 6.6
  } }
  it 'contains a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Prawn toast: £5.50, Siu mai: £4.00, Singapore vermicelli: £6.60"
    expect(menu.print_menu).to eq(printed_menu)
  end

  it 'tells if a dish is on the menu' do
    expect(menu.has_dish?(:"Prawn Toast")).to be true
  end
  
  it 'claculates a price' do
    expect(menu.price(:"Prawn Toast")).to eq(dishes[:"Prawn Toast"])
  end
end