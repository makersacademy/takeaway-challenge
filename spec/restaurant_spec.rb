require 'restaurant'

describe Restaurant do 

	it "can add an additional item to the menu" do
		subject.add_item_to_menu("Grapes", 2)
		expect(subject.menu_items).to include("Grapes" => 2)
	end

	it "prints out the menu" do
		expect(subject.show_menu).to include("Dosa" => 4)
	end

		
end