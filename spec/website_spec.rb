require 'website'

describe Website do 

	let(:website){Website.new}
	let(:menu){double :menu, dish:"Sushi", price:10}
	let(:quantity){double :quantity}
	

	it 'can add 1 dish to the order' do
		expect{website.add_order(menu)}.to change{website.menu_count}.to eq(1)
	end

	it 'can add 2 dishes to the order' do
		website.add_order(menu)
		expect{website.add_order(menu)}.to change{website.menu_count}.to eq(2)
	end


	it 'can add n dishes to the order' do 
		expect{quantity.times{website.add_order(menu)}}.to change{website.menu_count}.to eq(quantity)
	end



end 