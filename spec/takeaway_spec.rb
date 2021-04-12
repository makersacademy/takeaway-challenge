require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double(:menu, display: menu_list) }
  let(:order) { double(:order) }
  let(:meal) { { :"Chicken Katsu" => 2, :"Spring rolls" => 2 } }

  it 'should display the menu' do
    expect(takeaway.show_menu).to eq("Chicken Katsu: £20, Spring rolls: £10")
  end

  it 'allows to add several items in the basket' do
    expect(order).to receive(:add).at_least(:once)
    takeaway.take_order(meal)
  end
end
