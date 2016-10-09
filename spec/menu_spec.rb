require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  # let(:item) {double (:item) :pizza=>"Carne" :price=>10}
  it 'initialises a menu' do
    expect(menu).to be_a_kind_of(Menu)
  end

  it 'contains the contents of the menu' do
    expect(menu.menu[-1]).to eq({:pizza=>"Carne", :price=>10})
  end

  it 'prints out the menu' do
    expect(STDOUT).to receive(:puts)
    menu.print_menu
  end
end
