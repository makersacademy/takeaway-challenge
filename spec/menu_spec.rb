require 'menu'

describe Menu do 
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
    {
      pizza: 2.00,
      burger: 3.00
    }
  end  

  it "has a list of priced dishes" do
    expect(menu.dishes).to eq(dishes) 
  end   
  
  it "displays list of priced dishes" do
    displayed_menu = "Pizza £2.00, Burger £3.00"
    expect(menu.display).to eq(displayed_menu)
  end  
end    