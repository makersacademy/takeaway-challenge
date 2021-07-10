require 'menu'

RSpec.describe Menu do
  #it { is_expected.to respond_to :display_menu }

  it 'tells us the menu' do
    expect(subject.display_menu).to eq(Menu::MENU)
  end
end
