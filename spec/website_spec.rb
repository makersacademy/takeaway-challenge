require 'website'
require 'text_message'

describe Website do 

	let(:website){Website.new}
	let(:menu){double :menu, dish: "Sushi", price:10}
	

	it 'can add 1 dish to the order' do
		expect{website.add_order(menu)}.to change{website.menu_count}.to eq(1)
	end


	it 'can add 2 dishes to the order' do
		website.add_order(menu)
		expect{website.add_order(menu)}.to change{website.menu_count}.to eq(2)
	end


	it 'can give the total price when ordering 2 dishes' do 
		menu3 = {"Sushi" => 10}
		menu4 = {"Sashimi" => 20}
		website.add_order(menu3)
		website.add_order(menu4)
		expect(website.sum).to eq (30)
	end


	it 'can give the list of dishes with the prices and the quantities' do
		menu1 = {"Miso" => 5}
		menu2 = {"Sushi" => 10}
		menu3 = {"Sushi" => 10}
		menu4 = {"Sashimi" => 20}
		website.add_order(menu1)
		website.add_order(menu2)
		website.add_order(menu3)
		website.add_order(menu4)
		expect(website.total).to eq ({{"Miso"=>5}=> 1,{"Sushi"=>10}=>2,{"Sashimi"=>20}=>1})
	end


	it 'can raise an error message if the total price of the order is wrong' do
		allow(website).to receive(:order_incorrect).and_return(true) 	
		menu3 = {"Sushi" => 10}
		website.add_order(menu3)
		expect{website.sum}.to raise_error('The total amount is incorrect')
	end


	it 'can know the time of the order and give the maximum time for delivery' do
		expect(website.time).to eq ("21:13")
	end


	# it 'can send a text message' do
	# 	allow(website).to receive(:order_complete).and_return(true)
	# 	website.send
	# 	expect()
	# end





end 