require 'menu'

describe Menu do

let(:menu) {described_class.new}

context '#show_menu' do

	it 'shows a list of available items on the menu' do
		expect(menu.show_menu).to respond_to :each	end

end


end
