require 'takeaway'

describe Takeaway do

	subject (:takeaway)	{ described_class.new(menu) }
	let (:menu)			{ double(:menu, print_menu: print_out) }
	let (:print_out)	{ "menu" }	

	it 'has a menu' do
		expect(takeaway.view_menu).to eq menu.print_menu
	end
	
end