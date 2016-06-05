require 'takeaway'
require 'menu'

describe Takeaway do

	subject(:takeaway) { described_class.new }

	it "can list a menu of items and prices" do
		expect(takeaway.read_menu).to eq Menu::STANDARD_MENU
	end

	describe '#order' do

		it "is an empty hash before selecting items from the menu" do
			expect(takeaway.order).to be_a (Hash)
		end

	end
	
end