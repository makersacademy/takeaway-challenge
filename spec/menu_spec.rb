require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) } 
  let(:dishes) do
    { 
      potato: 2.50,
      fish: 8.50,
      chicken: 5.99,
      breadsticks: 3.99
    }
  end
  
  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "read the list with dishes and prices" do
    menu_list = "Potato £2.50, Fish £8.50, Chicken £5.99, Breadsticks £3.99"
    expect(menu.read).to eq(menu_list)
  end

  it "checks if a dish in on the menu" do
    expect(menu.has_dish?(:fish)).to be true
  end

  it "checks if a dish is not on the menu" do
    expect(menu.has_dish?(:beef)).to be false
  end
    
end
