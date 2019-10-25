require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it 'allows me to view a menu' do
    expect(menu.view).to eq({})
  end



end
