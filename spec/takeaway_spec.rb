require "takeaway"

describe Takeaway do

  let(:takeaway){Takeaway.new(menu: menu1, order: order1)} #takeaway doesn't need to know about the menu, so can inject menu as a dependency as an argument of initialize and it can then be stored as an instance variable
  let(:menu1) {double("fake menu", print: printed_menu)} #menu double so it isn't dependent on the menu argument, also need to add print method and it needs to return printed_menu
  let(:order1) {double ("fake order")} #need a double for an order class
  
  let(:printed_menu) {"Chicken: £3.50"}
  

  let(:ordered_dishes) do
    {chicken: 2, 
      lamb: 1, camel: 3}
    end





  #here I have created a takeaway object and injected in menu and passed in menu1 to be equal to it.
  #next I have created a double of the menu1 that i passed into menu: and also gave it a print method which returns a variable called printed_menu
  #finally i let printed_menu be equal to "Chicken: 3.50" which is now printed out
  
  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "allows you to select some number of multiple dishes" do
    expect(order1).to receive(:add).thrice
    (takeaway.place_order(ordered_dishes))
   
  end
  
end


  
  
