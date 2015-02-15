require 'menu'

class Menu_class; include Menu; end

describe Menu do
	let(:menu){Menu_class.new}

	it 'should have a list of available food' do
		expect(menu.food_item).not_to be_empty
	end

	it 'should have a list of prices' do
		expect(menu.item_price).not_to be_empty
	end  
	
	it 'should have food and drinks with the corresponding price' do
		expect(menu.menu.values).to include {keys :true}
	end

end