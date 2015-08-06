require 'menu'

class MenuSpec
  include Menu



describe MenuSpec do 

	describe "menu" do
	 	it "prints out the menu with correct items" do
			expect(subject.menu).to include("water" => 4)
	 	end 
	end

end

end

