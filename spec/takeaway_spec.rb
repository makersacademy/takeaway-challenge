require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, show: showed_menu) }
  let(:order) { double(:order) }

  let(:showed_menu) { "pierogi: £4.00" }
  let(:dishes) { { pierogi: 4.00, kopytka: 2.00, bigos: 5.20 } }

  it 'shows a list of dishes with prices' do
    expect(takeaway.show_menu).to eq(showed_menu)
  end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).exactly(3).times
    takeaway.order_food(dishes)
  end

end
