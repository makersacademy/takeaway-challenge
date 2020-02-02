require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }
    #injects the Hash making it easier for future updates to the menu
  let(:dishes) do 
    {
      pizza: 8.99,
      wedges: 2.50,
      soda: 1.00
      
    }
    end

  it " 1) Has a list of all the dishes on the menu with prices for each" do
    expect(menu.dishes).to eq(dishes)
  end

  it " 2) Prints a list of dishes with prices" do
    printed_menu = "Pizza £8.99, Wedges £2.50, Soda £1.00"
    expect(menu.menu_print).to eq (printed_menu)
    #This is from the mapping method pushes them out of a hash into an array
  
  end

end
