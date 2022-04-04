require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, display: display_menu) }
  let(:menu) { Menu.new }

context 'Menu' do
  it 'displays a list of dishes' do
    expect(menu.menu_items).to include['Chicken Tikka Masala']
    end
  end
end
