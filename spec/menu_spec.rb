require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  
  it 'stores menu items' do
    expect(menu).to respond_to(:menu_items)
  end
end
