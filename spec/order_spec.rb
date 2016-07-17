require 'order'

describe Order do
	let(:dish1) { double :dish, get_name: "Burger", get_price: 10 } 
	let(:dish2) { double :dish, get_name: "Lobster", get_price: 25 } 
	let(:menu) { double :menu, list_dishes: [dish1, dish2] }
	subject { described_class.new(menu: menu) }

	context "#read_menu" do
		it "reads a menu" do
			expect(subject.read_menu).to eq [dish1, dish2]
		end
	end

	before { subject.select_dish(dish1.get_name, 1) }	

	context "#select_dish" do
		it "adds a dish to your basket" do
			expect(subject.basket_summary).to include dish1
		end
		it "adds a specified quantity of a dish to your basket" do
			subject.select_dish(dish1.get_name, 3)
			expect(subject.basket_summary[dish1]).to eq 4
		end
	end

	context "#check_total_cost" do
		it "gives the total cost of items in your basket" do
			subject.select_dish(dish2.get_name, 2)
			expect(subject.check_total_cost).to eq 60 # 1x Burger & 2x Lobster
		end
	end

	context "#place_order" do
		it "raises an error if payment does not match total cost" do
			expect{ subject.place_order(15) }.to raise_error "Payment does not match total cost"
		end
		it "confirms that the order has been placed" do
			expect(subject.place_order(10)).to eq "Your order has been placed!"
		end
		# let(:client) { double :client }
		# it "sends a text saying that the order was placed successfully" do
		# 	message = 'order complete'
	 #    twilio_message_body = { from: ENV['TWILIO_PHONE'], to: ENV['TWILIO_DESTINATION_PHONE'], body: message }
	 #    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
	 #    expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
	 #    subject.send_message(ENV['TWILIO_DESTINATION_PHONE'], message)
		# end
	end

end