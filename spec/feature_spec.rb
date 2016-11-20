require 'takeaway'

describe "User Stories" do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
	it 'should allow user to view the menu' do
		takeaway = Takeaway.new(SMS, Order)
		expect(takeaway.view_menu).to eq Menu::MENU
	end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
	it 'should allow user to add items to an order' do
		takeaway = Takeaway.new(SMS, Order)
		expect(takeaway.place_order(1, 1)).to eq [{:number => 1, :item => "Cheese Pizza", :cost => "£5.99"}]
	end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
	it 'should allow the user to check their order total' do
		takeaway = Takeaway.new(SMS, Order)
		takeaway.place_order(2, 1)
		takeaway.place_order(3, 1)
		expect(takeaway.check_total).to eq "Total: £13.98"		
	end

	it 'should raise error if user attempts to pay incorrect amount' do
		takeaway = Takeaway.new(SMS, Order)
		takeaway.place_order(2, 1)
		takeaway.place_order(3, 1)
		message = "Payment amount is incorrect."
		expect{takeaway.pay(4.00)}.to raise_error message
	end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
	it 'should send user a text message to confirm payment and delivery' do
		allow(ENV).to receive(:[]).with("TWILIO_ACCOUNT_SID").and_return("a123")
		allow(ENV).to receive(:[]).with("TWILIO_AUTH_TOKEN").and_return("a456")
		allow(ENV).to receive(:[]).with("TWILIO_PHONE").and_return("+789")
		allow(ENV).to receive(:[]).with("TWILIO_DESTINATION_PHONE").and_return("+012")
		takeaway = Takeaway.new(SMS, Order)
		takeaway.place_order(2, 1)
    	VCR.use_cassette('twilio') do
    		takeaway.pay(6.99)
    	end
	end

end