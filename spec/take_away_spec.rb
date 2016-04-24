require 'take_away'
describe TakeAway do
  subject(:takeaway)  {described_class.new(menu: menu)}
  let(:menu) {double :menu, list_menu: list_menu}
  let(:list_menu) {"Pollo, $5"}
  it 'shows the menu with the dishes and prices' do
    expect(takeaway.show_menu).to eq list_menu
  end
end
