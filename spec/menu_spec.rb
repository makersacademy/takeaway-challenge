require  'menu'

RSpec.describe Menu do 

  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do {
    pizza: 5.50,
    fish: 6.75
  }
end

  it 'has a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

  it 'prints a list of dishes with prices' do 
    printed_menu = "Pizza £5.50, Fish £6.75"
    expect(menu.print_dishes).to eq printed_menu
  end

  it "tells if a dish is on the menu" do 
    expect(menu.has_dish?(:pizza)).to be true
  end

  it 'tells if a dish is not on the menu' do 
    expect(menu.has_dish?(:beef)).to be false
  end

end