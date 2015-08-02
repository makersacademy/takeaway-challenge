require 'customer'


describe Customer do 

 it "welcomes the customer & prints menu" do
 	expect(subject).to respond_to :welcome_message
 end

it "allows a customer to see a menu" do
	expect(subject).to respond_to :see_menu
end

it "allows customer to place an order" do 
	expect(subject).to respond_to :place_order
end

it "allows customer to verify an order" do
	expect(subject).to respond_to :verify_order
end



end