require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it 'has a list of food items and prices' do
    expect(menu.menu_items).not_to be_empty
  end
end
