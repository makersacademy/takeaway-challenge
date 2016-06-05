require 'takeaway'
require 'menu'

describe Takeaway do

	subject(:takeaway) { described_class.new }

	let(:menu) { double(:menu, display_menu: true) }

	it "can list a menu of items and prices" do
		expect(takeaway.read_menu).to eq Menu::STANDARD_MENU
	end
	
end