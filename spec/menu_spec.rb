require 'menu'

describe 'restaurant has a menu' do
	it 'can be viewed' do
		menu = Menu.new
		expect(menu.view_menu).to eq ({'meat' => 7, 'fish' => 8})
	end
end
