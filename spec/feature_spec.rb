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
	let(:client) { double(:client, messages: messages) }
	let(:messages) { double(:messages) }
	let(:delivery_time) { double(:delivery_time) }

	it 'should send user a text message to confirm payment and delivery' do
		message = "Thank you. Received payment of £6.99. Your order will be delivered by 17:25"
	  	client_arguments = {from: ENV['TWILIO_PHONE'], to: ENV['TWILIO_DESTINATION_PHONE'], body: message }
	  	allow(messages).to receive(:create).with client_arguments
	  	allow(Time).to receive(:now).and_return(Time.parse("16:25"))
	  	expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
		
		takeaway = Takeaway.new(SMS, Order)
		takeaway.place_order(2, 1)
    	takeaway.pay(6.99)
	end

end