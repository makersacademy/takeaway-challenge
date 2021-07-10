require 'menu'

RSpec.describe Menu do

  it 'tells us the menu' do
    expect(subject.display_menu).to eq(Menu::MENU)
  end
end
