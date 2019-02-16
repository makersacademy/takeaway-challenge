require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

<<<<<<< HEAD
  # let(:order) { double(:order) }
  # let(:dishes) { {chicken: 2, pizza: 1} }

=======
>>>>>>> 7b3ebab4aabd03c627c11888a7f5b02a20159340
  describe "#view_menu"
  it 'allows me to view a menu' do
    expect(subject.view_menu).to eq(["Chicken £3.50", "Pizza £4"])
  end

<<<<<<< HEAD
  describe "#place order"
  it 'lets me order any quantity of available dishes' do
    dish = "Pizza"
    quantity = 2
    order_double = double(:dish => dish, :quantity => quantity)
    expect(subject.add_order(order_double)).to eq "#{dish}, #{quantity}"
  end

  describe '#calculates total'
  it 'check that the total I have been given matches the sum of the various dishes in my order' do

  end

  end
=======

>>>>>>> 7b3ebab4aabd03c627c11888a7f5b02a20159340

end
