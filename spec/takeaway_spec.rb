require "takeaway"

describe TakeAway do

	subject(:takeaway) { described_class.new(menu: menu, order: order) }

	let(:menu) { double(:menu, show: shown_menu ) }
	let(:order) { double(:order) }
	let(:shown_menu) {double("cheese cake: £5")}

	let(:food) { {Pizza: 1, Green_Shake: 3}}

		it "shows the menu with a list of dishes and prices" do
			expect(takeaway.read_menu).to eq(shown_menu)
		end

		it "accepts orders" do
			expect(order).to receive(:add).twice
			takeaway.place_order(food)
		end


end
