require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, read: display_menu) }
  let(:display_menu) { "Ginger Fried Vegetables: £5.99" }
  let(:order) { double(:order) }

  let(:dishes) { {pork: 2, prawns: 4} }

  it 'displays menu of dishes with prices' do
    expect(takeaway.read_menu).to eq(display_menu)
  end
  it 'can order dishes from menu' do
    expect(order).to receive(:add).twice
    expect(takeaway.place_order(dishes))
  end
end
