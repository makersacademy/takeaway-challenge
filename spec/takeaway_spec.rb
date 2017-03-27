require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Samosa: 6.50" }
  let(:order) { instance_double("Order", total: 31) }
  let(:dishes) { {samosa: 4, naan: 2} }


  it 'has an array of dishes and related prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end

  it 'can order dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(31)
  end

end
