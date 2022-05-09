require 'menu'

describe Menu do

  #instantiate subject to already have a menu inside it
  subject(:menu) { described_class.new(dishes: dishes) }

  let (:dishes) do {
    Rice: 3.00,
    Chicken: 4.00,
    Soup: 2.00 
  }
end

  it "has a list of dishes" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints out the menu name and price" do
    printed_example = "Rice £3.00, Chicken £4.00, Soup £2.00"
    expect(menu.print_menu).to eq (printed_example)
  end


end
