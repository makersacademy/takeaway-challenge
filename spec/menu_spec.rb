require 'menu'

describe Menu do
let(:menu) { Menu.new("pizza", 10)}

  it 'stores dishes and prices' do
    expect(menu.show).to eq ("pizza, 10")
  end
end
