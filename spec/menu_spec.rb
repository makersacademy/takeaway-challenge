require 'menu'

describe Menu do
  subject(:menu) { Menu.new }
  it 'displays the menu' do
    expect(menu.display).to eq({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
  end
end
