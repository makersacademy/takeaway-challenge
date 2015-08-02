require 'menu'

describe Menu do 

	it "holds a menu of items and prices" do
		subject.add_item_to_menu("Banana", 1)
		expect(subject.menu_items).to include("Banana" => 1)
	end

	it "can add an additional item to the menu" do
		
		subject.add_item_to_menu("Grapes", 2)
		expect(subject.menu_items).to include("Grapes" => 2)
	end

end


describe BenMenu do

	it "prints out the menu with correct items" do
		expect(subject.menu_items).to include("Dosa" => 4)
	end

end

		