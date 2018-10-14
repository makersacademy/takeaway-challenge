require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, print: 'Falafel: £3') }
  let(:order) { double(:order) }

  it 'allows the user to see a list of dishes and prices' do
    expect(takeaway.display_menu).to eq 'Falafel: £3'
  end

  it 'allows the user to checkout an order' do
    expect(takeaway.checkout).to eq "Thankyou your order has been placed"

  end
end
