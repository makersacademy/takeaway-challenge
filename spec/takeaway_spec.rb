require 'takeaway'
require 'order'
describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: "Tacos, £6" ) }
  let(:order) { double(:order, total: 12) }
  let(:meals) { { tacos: 1, burrito: 2} }


  it 'prints meals menu with prices' do
    expect(takeaway.print_menu).to eq("Tacos, £6")
  end

  it 'select meals to order' do
     2.times { expect(subject.order).to receive(:add) }
     subject.place_order(meals)
  end

  it 'gives order total' do
    allow(order).to receive(:add)
    total = subject.place_order(meals)
    expect(total).to eq(12)
  end
end
