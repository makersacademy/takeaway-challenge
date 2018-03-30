require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new(menu) }

	let(:menu) { double(:menu, print: printed_menu) }
	let(:printed_menu) { "Hotdog - £2" }	

 	it 'has a list of menu items' do

		expect(takeaway.print_menu).to eq(printed_menu) 

	end  

end