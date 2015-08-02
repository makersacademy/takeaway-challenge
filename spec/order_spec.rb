require 'order'


describe Order do 


 it "adds an item to the order" do
 	subject.add_items_to_order("Dosa", 3)
 	expect(subject.dishes_ordered).to include("Dosa", "Dosa", "Dosa")
 end

 #Need to double to avoid continual error raising.
 xit "raises an error if the dish is not on the menu" do
 	subject.add_items_to_order("Pizza", 3)
 	expect(subject.dishes_ordered).to raise_error "Order something on the menu!"
 end

 it "holds the correct number of dishes" do
 	subject.add_items_to_order("Dosa", 3)
 	expect(subject.dishes_ordered.count).to eq 3 
 end

 #working in IRB
 it "calculates the order total" do
 	subject.add_items_to_order("Dosa", 3)
 	expect(subject.order_total).to eq 12
 end


	
end