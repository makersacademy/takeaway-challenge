require 'takeaway'
require 'order'

describe Takeaway do
  let(:order) { described_class.new }
  let(:menu) { described_class.new }

  it 'shows the menu' do
    printed_menu = "Chicken: £5, Potato: £2"
    expect(subject.view_menu).to eq(printed_menu)
  end

  it 'instantiated a new order instance' do
    expect(subject.place_order).to be_instance_of Order
  end
end
