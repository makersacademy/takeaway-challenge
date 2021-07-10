require 'takeaway'

describe Takeaway do j
    subject { described_class.new(menu: menu) }

	let(:menu) { double(:menu, print: printed_menu) }
	let(:printed_menu) { "Egg fried rice: £3.30" }

	let(:dishes) { {egg_fried_rice: 3.30} }
	
	it "calls print_menu on itself expecting it to equal printed_menu" do
		expect(subject.print_menu).to eq(printed_menu)

    end
end