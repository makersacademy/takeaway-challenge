require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:printed_menu) { "Burger - £5.99"}
  let(:order) { double(:order) }

  let(:dishes) { {burger: 3, chips: 1, coke: 2} }

  it 'shows the menu and prices' do
    expect(takeaway.show_menu).to eq(printed_menu)
  end

  it "can order dishes" do
    expect(order).to receive(:add).exactly(3).times
    takeaway.place_order(dishes)
  end
end