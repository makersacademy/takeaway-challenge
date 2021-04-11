require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double(:menu, display: menu_list) }
  let(:order) { double(:order, total: 100) }
  let(:menu_list) { "Chicken Katsu: £20, Spring rolls: £10" }
  let(:meal) { { :"Chicken Katsu" => 2, :"Spring rolls" => 2 } }

  it 'should display the menu' do
    expect(takeaway.show_menu).to eq(menu_list)
  end

  it 'allows to add several items in the basket' do
    expect(order).to receive(:add).at_least(:once)
    takeaway.take_order(meal)
  end

  it 'should return a total' do
    allow(order).to receive(:add)
    total = takeaway.take_order(meal)
    expect(total).to eq(100)
  end
end
