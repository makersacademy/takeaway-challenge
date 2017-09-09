require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'prints the menu to the screen' do
    expect(menu.italian_menu).to eq({:pasta => 10,
      :pizza => 15,
      :risotto => 20})
  end
end
