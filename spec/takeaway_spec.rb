require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  # we've injected our order, and now we need to interact with it
  let(:menu) {double(:menu, print: printed_menu)}
  let(:printed_menu) { "Chicken £3.50" }
  let(:order) { double(:order) }
  let(:dishes) { {chicken: 2, pizza: 1} }

  describe "#view_menu"
  it 'allows me to view a menu' do
    expect(subject.print_menu).to eq(printed_menu)
  end

  # describe "#place order"
  # it 'lets me order any quantity of available dishes' do
  #   dish = "Pizza"
  #   quantity = 2
  #   order_double = double(:dish => dish, :quantity => quantity)
  #   expect(subject.add_order(order_double)).to eq "#{dish}, #{quantity}"
  # end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)

  end

end
