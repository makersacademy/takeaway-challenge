require 'menu'

describe Menu do

  it 'has a menu saved as a hash' do
    expect(Menu::MENU).to be_kind_of(Hash)
  end

end
