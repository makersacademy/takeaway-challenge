require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  it 'displays the menu' do
    expect(menu.display).to eq ["stake", "ravioli", "augbergine salad"]
  end
end
