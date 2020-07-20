require "menu"
require "menu"

describe Menu do

    subject(:menu) { described_class.new(dishes) } 
    let(:dishes) {
       {
        Rice: 1.50,
        chicken: 2.00,
        salad: 4.00,
        Plantain: 2.50 
       }
    }
  it "has the list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_list = "Rice £1.50, Chicken £2.00, Salad £4.00, Plantain £2.50" 
    expect(menu.printing).to eq(printed_list)
  end

  it "says if a dish is on menu" do
    expect(menu.has_dish?(:chicken)).to eq(true)
  end

  it "says if a dish is on menu" do
    expect(menu.has_dish?(:beef)).to eq(false)
  end

end
