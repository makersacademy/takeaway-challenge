require 'order'


describe Order do 


 it "adds an item to the order" do
 	subject.add_items_to_order("water", 3)
 	expect(subject.dishes_ordered).to include("water", "water", "water")
 end

 #Need to double to avoid continual error raising.
 xit "raises an error if the dish is not on the menu" do
 	subject.add_items_to_order("Banana pancake", 3)
 	expect(subject.dishes_ordered).to raise_error "Order something on the menu!"
 end

 it "holds the correct number of dishes" do
 	subject.add_items_to_order("water", 3)
 	expect(subject.dish_count).to eq 3 
 end

 #Now working - but with overwrite issue.
 it "calculates the order total" do
 	subject.add_items_to_order("water", 6)
 	expect(subject.order_total).to eq 24
 end


 it "shows the order - items & quantity" do
 	 expect(subject).to respond_to :show_order
 end

 it "raises an error if payment amount is incorrect" do
 	subject.add_items_to_order("water", 6)
 	expect{ subject.checkout(23) }.to raise_error 'You have not paid the correct amount.'
 end

 it "sends a confirmation message if payment amount is correct" do
 	subject.add_items_to_order("water", 6)
 	expect(subject.checkout(24)).to eq "Order received. A text message confirmation will be sent to you shortly."
 end

	
end