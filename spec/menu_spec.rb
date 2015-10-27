require 'menu'

describe Menu do
  subject(:menu) { described_class.new(menu_name: :italian)}

  it '#show returns a menu' do
    expect(menu.show).to include 'Spaghetti Carbonara: £9.50'
  end
  it '#listed? returns true if item is on the menu' do
    expect(menu.listed? 'Spaghetti Carbonara').to eq true
  end
  it '#listed returns fals if item is not on the menu' do
    expect(menu.listed? 'Chips').to eq false
  end
end
