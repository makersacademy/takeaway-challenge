require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should present a menu to the customer' do
    expect(menu.give).to eq Menu::MENU
end





end
