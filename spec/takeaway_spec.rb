require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: nil) }

  let(:menu) { double(:menu, print: printed_menu) }
  let (:order) { double (:order) }
  let(:printed_menu) { 'menu'}

  let(:dishes) { {chicken: 2, fish: 1} }

  it 'displays menu, lists out dishes and their prices' do
    expect(takeaway.print_menu).to eq (printed_menu)
  end

  it 'can order X number of various available options' do
    allow(order).to receive(:add)
    expect(takeaway.place_order(dishes)).to eq('Your order is for £15.5')
  end

end
