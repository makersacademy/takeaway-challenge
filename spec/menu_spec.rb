require 'menu'

describe Menu do
  let(:menu) { Menu.new("Menu 1") }

  it 'should have a name' do
    expect(menu.name).to eq("Menu 1")
  end





end
