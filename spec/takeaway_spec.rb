require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, read: display_menu) }
  let(:display_menu) { "Ginger Fried Vegetables: £5.99" }
  let(:order) { instance_double("Order", total: 22.45) }

  let(:dishes) { {pork: 2, prawns: 4} }

  it 'displays menu of dishes with prices' do
    expect(takeaway.read_menu).to eq(display_menu)
  end
  it 'can order dishes from menu' do
    expect(order).to receive(:add).twice
    expect(takeaway.place_order(dishes))
  end
  it 'summarises order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(22.45)
  end
end
