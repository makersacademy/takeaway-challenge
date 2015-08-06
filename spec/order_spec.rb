require 'order'


describe Order do 


 it "adds an item to the order" do
 	subject.add_items_to_order("water", 3)
 	expect(subject.dishes_ordered).to include("water", "water", "water")
 end

 #Need to double to avoid continual error raising.
 it "raises an error if the dish is not on the menu" do
 	subject.add_items_to_order("Banana pancake", 3)
 	expect(subject.add_items_to_order :coke, 1r).to eq "Order something on the menu!"
 end

 it "holds the correct number of dishes" do
 	subject.add_items_to_order("water", 3)
 	expect(subject.dish_count).to eq 3 
 end

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
 	expect(subject).to receive(:send_sms)
 	expect(subject.checkout(24)).to eq "Order received. A text message confirmation will be sent to you shortly."
 end

 # good order 
  # expect(subject).to receive(:sens_sms)
  # subject.checkout(correct_amount)

  # bad order
  # expect{subject.checkout(bad_anout)}.to raise_error "you didnt enter enough"

	
end