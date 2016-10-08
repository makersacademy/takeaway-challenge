require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:item) {double :menu, :pizza => "Carne", :price => 10.50}
  it 'initialises a menu' do
    expect(menu).to be_a_kind_of(Menu)
  end

  it 'contains the contents of the menu' do
    expect(menu.menu[-1]).to eq(item)
  end


end
