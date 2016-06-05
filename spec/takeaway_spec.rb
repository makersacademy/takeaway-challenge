require 'takeaway'

describe Takeaway do
	it 'will show the menu' do
		expect(takeaway.show_menu).to eq("Pizza: £14.00")
	end
end