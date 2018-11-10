require "menu.rb"

describe Menu do

	let ("soup") { double "dish_name" }
	let ("beer") { double "dish_name" }
	let ("fish") { double "dish_name" } #not exist

	it "shows menu" do
		expect(subject.show_menu).to include ({:soup => 4.5, :fried_rice => 7.0})
	end

	it "check if the dish exist on menu - exist dish" do
		expect(subject.on_menu?("soup")).to eq true 
	end

	it "check if the dish exist on menu - exist dish" do
		expect(subject.on_menu?("fish")).to eq false 
	end


end