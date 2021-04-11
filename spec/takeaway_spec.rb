require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, display: menu_list) }
  let(:menu_list) { "Chicken Katsu: £20, Spring rolls: £10"}

  it 'should display the menu' do
    expect(subject.show_menu).to eq(menu_list)
  end
end
