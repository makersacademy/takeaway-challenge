require 'menu'

describe Menu do

	subject(:menu)		{ described_class.new }
	let(:printed_menu)	{ double(:printed_menu) }


	it {is_expected.to respond_to(:print_menu)}

	it 'can display a list of all available dishes' do
		expect(menu.print_menu).to eq printed_menu
	end

end