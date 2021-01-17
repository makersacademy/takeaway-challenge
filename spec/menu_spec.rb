require "menu"

describe Menu do
# Using dependency injection we can store the dishes within our menu. 
# So the below will inject the hash into the menu

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    { spring_roll: 0.99, 
      char_sui_bun: 3.99, 
      pork_dumpling: 2.99, 
      peking_duck: 7.99, 
      fu_king_fried_rice: 5.99 }
  end
  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end
  it "prints out the menu with prices" do
    print_menu = "Spring_roll £0.99, Char_sui_bun £3.99, Pork_dumpling £2.99, Peking_duck £7.99, Fu_king_fried_rice £5.99"
    expect(menu.print).to eq(print_menu)
  end
    
end
