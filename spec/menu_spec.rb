require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:item) { double(item) }
  let(:price) { double(price) }

  it 'has a menu saved as a hash' do
    expect(Menu::MENU).to be_kind_of(Hash)
  end

  it 'can print the menu items and prices to the screen' do
    expect{menu.show_menu}.to output.to_stdout
  end

end
