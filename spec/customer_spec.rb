require 'customer'


describe Customer do 

it "displays the menu when requested" do 
	expect(subject).to respond_to :see_menu
	expect(subject.see_menu).to include("Dosa" => 4)
end

it "allows customer to place an order" do 
	expect(subject).to respond_to :place_order
end

it "allows customer to verify an order" do
	expect(subject).to respond_to :verify_order
end


end