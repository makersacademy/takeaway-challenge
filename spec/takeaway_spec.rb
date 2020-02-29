require 'takeaway'

describe Takeaway do

  let (:menu) { double(:menu, print: printed_menu) }
    
    
  it "initializes with an empty basket" do
    expect(subject).to have_attributes(basket: {})
  end    

#   it "initializes with the menu" do
#   expect(subject).to receive(menu)
#   end

end 