require "takeaway"

describe Takeaway do

  let(:takeaway){Takeaway.new(menu: menu1)} #takeaway doesn't need to know about the menu, so can inject menu as a dependency as an argument of initialize and it can then be stored as an instance variable
  let(:menu1) {double("fake menu", print: printed_menu)} #menu double so it isn't dependent on the menu argument, also need to add print method and it needs to return printed_menu
  let(:printed_menu) {"Chicken: 3.50"}

  #here I have created a takeaway object and injected in menu and passed in menu1 to be equal to it.
  #next I have created a double of the menu1 that i passed into menu: and also gave it a print method which returns a variable called printed_menu
  #finally i let printed_menu be equal to "Chicken: 3.50" which is now printed out
  
  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
 
  
  
end