require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it 'shows the list of items in the menu' do
    expect(menu.items).to eq(described_class::ITEMS)
  end

  it 'should cost 10 for pizza' do
    expect(menu.items["pizza"]).to eq 10
  end
end
