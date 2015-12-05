require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:dish) { double :dish => "Dish 1"}
  let(:order) { double :order, inject: [["Dish 1" => 2.00]], length: 3}
  let(:quantity) { double :quantity => 3}
  let(:total) { double :total => 6}

  describe '#menu' do
    it 'should display a list of dishes with prices' do
      expect(takeaway.list).not_to be_empty
    end
  end

  describe '#choose' do
    it 'should enable a user to select a dish' do
      takeaway.choose("Dish 1")
      expect(takeaway.order).to include(["Dish 1", 1.0])
    end

    it 'should enable a user to select multiple quantities of dishes' do
      takeaway.choose("Dish 1", 2)
      expect(takeaway.order).to include(["Dish 1", 1.0])
    end
  end

  describe '#place_order' do

    it 'raises an error if the total cost does not equal the sum of dishes' do
      allow(order).to receive(:each)
      takeaway.calculate_quantities(order)
      takeaway.calculate_cost(order)
      expect{ takeaway.place_order(order, quantity, total) }.to raise_error "Wrong total!"
    end

    # send a text to confirm order
  end

  describe '#calculate_quantities' do
    it 'calculates how many dishes have been ordered' do
      allow(order).to receive(:each)
      takeaway.calculate_quantities(order)
      expect(takeaway.quantity).not_to be_nil #vacuous?
    end
  end

  describe '#calculate_cost' do
    it 'calculates how much the order costs' do
      takeaway.calculate_cost(order)
      expect(takeaway.total).not_to be_nil #vacuous?
    end
  end
end
