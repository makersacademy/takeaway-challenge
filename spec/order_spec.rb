require 'order'
require 'menu'
describe Order do
  subject(:order) { described_class.new }

  context "basket" do
  it 'should initialize with an empty basket hash' do
    expect(order.basket).to be_empty
  end
end
  context "menu" do
  it 'should be able to access the menu' do
    expect(order.menu).to eq Menu::MENU
  end
end


end
