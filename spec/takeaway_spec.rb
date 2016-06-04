require "takeaway"

describe TakeAway do

subject(:takeaway) { described_class.new(menu) }
let(:menu) { double(:menu, show: shown_menu) }
let(:shown_menu) {double("cheese cake: £5")}

	it "shows the menu with a list of dishes and prices" do
		expect(takeaway.read_menu).to eq(shown_menu)
	end



end
