require 'take_away'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  # adding double:
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { 'Sausage: £5' }

  let(:dishes) { { sausage: 2, chips: 1 } }

  it "Shows the menu with list of dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
  it 'can order some number of several dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
