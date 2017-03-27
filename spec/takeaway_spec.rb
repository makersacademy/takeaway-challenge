require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Samosa: 6.50" }

  let(:order) { instance_double("Order", total: 10) }
  let(:dishes) { {samosa: 1, naan: 5} }


  it 'has an array of dishes and related prices' do
      expect(takeaway.read_menu).to eq(printed_menu)
    end

  it 'can order dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'shows the price of the dish' do
    allow(order).to receive(:add)
    amount = takeaway.sum(dishes)
    expect(amount).to eq(10)
  end

end
