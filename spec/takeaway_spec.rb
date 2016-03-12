require 'takeaway'

describe Takeaway do

  let(:order) { double(:order, price: 7, confirm: nil) }
  let(:order_class) { double(:order_class, new: order)}
  subject(:takeaway) { described_class.new(order_class) }
  let(:dish1) { {name: 'sushi', amount: 3} }
  let(:dish1_with_price) { {name: 'sushi', amount: 3, price: 7} }

  describe '#initialize' do
    it '0.0 initializes an takeaway a order' do
      expect(takeaway.order).to eq order
    end
    it '0.1 initializes an takeaway with an empty list of dishes' do
      expect(takeaway.basket).to eq([])
    end
  end

  describe '#place_order' do
    before(:each) do
      takeaway.place_order(dish1, 21)
    end
    it '1.0 calls price method on order' do
      expect(takeaway.order).to have_received(:price)
    end
    it '1.1 adds dishes (with price info) to the basket' do
      expect(takeaway.basket).to include(dish1_with_price)
    end
    it '1.2 raises an error if the given and actual total do not match' do
      message = 'Re-calculate the total price'
      expect{takeaway.place_order(dish1, 45)}.to raise_error message
    end
    it '1.3 sends a confirmation text if total is correct' do
      expect(order).to have_received(:confirm)
    end
  end

  describe '#total' do
    it '2.0 calculates the total price of the order' do
      takeaway.place_order(dish1, 21)
      dish1_total = dish1_with_price[:amount]*dish1_with_price[:price]
      expect(takeaway.total).to eq(dish1_total)
    end
  end
end
