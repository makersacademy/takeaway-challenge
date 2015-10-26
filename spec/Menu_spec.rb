require 'Menu'

describe Menu do

	subject(:menu) {described_class.new}
	
	it 'Should allow you to see the menu' do
    expect(subject.see_menu).to eq Menu::DEFAULT_MENU
  end


	
end