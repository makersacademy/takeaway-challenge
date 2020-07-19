require "menu"

describe Menu do

    subject(:menu) { described_class.new(dishes) } 
    let(:dishes) {
       {
        Rice: 1.50,
        Chicken: 2.00,
        salad: 4.00,
        Plantain: 2.50 
       }
    }
  it "has the list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

end
