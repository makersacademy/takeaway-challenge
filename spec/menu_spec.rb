require 'Menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) { { pizza: 1.00, pasta: 2.00} } 

  it "displays a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "displays the list of dishes with prices" do
    display_menu = "pizza £1.00, pasta £2.00"
    expect(menu.display_menu).to eq(display_menu)
  end 
    
end
