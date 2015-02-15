require 'website'

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


	it 'can sum the prices of 2 dishes' do 
		menu3 = {"Sushi" => 10}
		menu4 = {"Sashimi" => 20}
		website.add_order(menu3)
		website.add_order(menu4)
		expect(website.sum).to eq (30)
	end









end 