require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe 'menu items presentation:' do
  it 'On initialization can show contents of a restaurant menu' do
    expect(menu.menu_items).not_to be_empty
    end
  end
end
