require 'place_order'


describe PlaceOrder do


  it "Is able to add an item to the basket." do
   subject.get_order("Haggis Supper")
   expect(subject.basket).to contain_exactly(order: "Haggis Supper", quantity: 1)
 end

 it "Is able to confirm an item has been added to the basket" do
   confirmation = "Haggis Supper added to your basket\n"
   expect{subject.get_order("Haggis Supper")}.to output(confirmation).to_stdout
 end

 it "Is able to check if an item is available" do
   message =  "Nane left.\n"
   expect{subject.get_order("Deep-fried Foo")}.to output(message).to_stdout
 end



end
