require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, read: display_menu) }
  let(:display_menu) { "Ginger Fried Vegetables: £5.99" }

  it 'displays menu of dishes with prices' do
    expect(takeaway.read_menu).to eq(display_menu)
  end
end
