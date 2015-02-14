require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  it 'has a dish' do
    expect(menu.dish).to eq 'Wolf Nipple Chips'
  end

end