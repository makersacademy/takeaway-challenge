require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  
  it 'should possess a default menu' do
    expect(menu.menu).to eq Menu::DEFAULT_MENU
  end
end
