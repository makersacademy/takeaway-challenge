require 'menu'
require 'order'

describe Menu do
	describe '#see_menu' do
		it 'shows a menu list with the available dishes and their prices' do
			expect(subject.see_menu).to eq("fried eggs with bacon" => 6.00,
			"eggs benedict with avocado" => 7.50,
			"scrambled eggs with mozzarella" => 7.00,
			"pancakes with chocolate" => 7.50,
			"yoghurt with fresh fruit" => 6.00)
		end
	end
end

describe Order do
	describe '#select_items' do
		it 'lets the customer select the items they want' do
			menu = Menu.new
			menu.see_menu
			subject.select_items("fried eggs with bacon", 3)
			expect(subject.order).to eq({"fried eggs with bacon"=> 3})
	  end
	
		it 'does not let the customer select an item if it is not in the menu' do
			menu = Menu.new
			menu.see_menu
			subject.select_items("orange juice", 3)
			expect{ subject.order }.to raise_error
		end
	end
end
