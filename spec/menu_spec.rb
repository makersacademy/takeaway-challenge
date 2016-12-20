require 'menu'

describe Menu do

	let(:takeaway) { (Class.new {include Menu}).new }

	it 'should display the menu' do
		expect(takeaway.view_menu).to eq Menu::MENU
	end

end