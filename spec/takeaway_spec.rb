require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, display: menu_list) }
  let(:menu_list) { "Chicken Katsu: £10\n Chips: £2" }

  it 'allows to display the menu' do
    expect(takeaway.display_menu).to eq(menu_list)
  end
end
