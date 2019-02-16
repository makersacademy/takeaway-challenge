require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(order: order) }
  let(:order) { double(:order) }
  let(:dishes) { {chicken: 2, pizza: 1} }

  describe "#view_menu"
  it 'allows me to view a menu' do
    expect(subject.view_menu).to eq(["Chicken £3.50", "Pizza £4"])
  end

  describe "#place order"
  # it 'lets me order any quantity of available dishes' do
  #   dish = "Pizza"
  #   quantity = 2
  #   order_double = double(:dish => dish, :quantity => quantity)
  #   expect(subject.add_order(order_double)).to eq "#{dish}, #{quantity}"
  # end

  it 'lets me order some number of available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end


  # describe '#calculates total'
  # it 'check that the total I have been given matches the sum of the various dishes in my order' do
  #
  # end


end
