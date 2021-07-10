require 'takeaway'

describe Takeaway do
	subject { described_class.new(menu: menu, order: order) } 

	let(:menu) { double(:menu, print: printed_menu) }
	let(:order) { double(:order) }
	let(:printed_menu) { "Egg fried rice: £3.30" }

	let(:dishes) { {dim_sum_platter: 2, shrimp_fu_yung: 1} }
	
	it "calls print_menu on itself expecting it to equal printed_menu" do
		expect(subject.print_menu).to eq(printed_menu)
	end

	it "calls place_order on itself taking dishes as arg expecting it to equal sum value of dishes" do
		expect(order).to receive(:add).twice
		subject.place_order(dishes)
	end

end
