require "menu"

describe Menu do

   subject(:menu) { described_class.new(dishes) }

   let(:dishes) do
    { "meat feast pizza" => 9.99,
      "margarita pizza" => 7.99,
      "chicken burger" => 4.99,
      "veggie Burger" => 3.99,
      "fries" => 2.99,
      "donner kebab" => 7.99 }
  end   
  
  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end 

  it "prints the list of dishes with prices" do
    printed_menu = "Meat feast pizza £9.99, Margarita pizza £7.99, Chicken burger £4.99, Veggie burger £3.99, Fries £2.99, Donner kebab £7.99"
    expect(menu.print).to eq(printed_menu)
  end



end
