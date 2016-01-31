require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new}
  let(:menu_list) {double (:menu_list)}
  let(:basket) {double (:basket)}
  let(:dish) {double (:dish)}


  it 'should display the menu' do
    expect(order.menu_list).to eq Menu::MENU_LIST
  end

  it 'should add dishes to an empty basket' do
    expect(order.add(dish)).to eq @basket
  end

end
