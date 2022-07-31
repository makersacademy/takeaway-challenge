require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 10.89) }
  let(:printed_menu) { "Cheesburger: £0.99" }
  let(:food) { { cheesburger: 2, hamburger: 1, fanta: 3, fries: 3, sundae: 4 } }

  it 'displays menu and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'allows a customer to be able to select some number of several available dishes and order' do
    allow(order).to receive(:add).at_least(:once)
    expect(takeaway.order_takeaway(food))
  end

  it 'checks that the total is correct' do
    allow(order).to receive(:add)
    total = takeaway.order_takeaway(food)
    expect(total).to eq(10.89)
  end
end
