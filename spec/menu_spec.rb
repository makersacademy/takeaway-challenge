require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:menu_list) {double (:menu_list)}

  it 'should display the dishes and their prices' do
    expect(menu.menu_list).to eq Menu::MENU_LIST
  end
end
