require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it 'displays the menu' do
    expect(menu.view).to eq "menu"
  end

end
