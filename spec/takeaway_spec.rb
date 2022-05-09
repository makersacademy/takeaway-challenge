require 'takeaway'

describe Takeaway do
  it 'instantiates a Takeaway class' do
    expect(subject).to be_a_kind_of Takeaway
  end

  describe '#menu' do
    it 'has a menu method' do
      expect(subject).to respond_to(:menu)
    end

    it 'prints out the menu itmes and their prices' do
      expect(subject.menu).to include("tacos" => 5)
    end
  end

  describe '#order' do
    it 'has an order method that accepts items and quantity methods' do
      expect(subject).to respond_to(:order).with(2).arguments
    end

    it 'returns an array of hashes with item and quantity ordered' do
      subject.order("tacos", 2)
      expect(subject.selected_items).to include("tacos" => 2)
    end
  end

  describe '#total' do
    it 'has a total method' do
      expect(subject).to respond_to(:total)
    end

    it 'returns the total of the order' do
      subject.order("burritos", 2)
      subject.order("tacos", 3)
      expect(subject.total).to eq("The total for the order is £29.")
    end
  end

  describe '#receipt' do
    it 'has a receipt method' do
      expect(subject).to respond_to(:receipt)
    end

    it 'prints out entire receipt' do
      subject.order("burritos", 2)
      subject.order("tacos", 3)
      expect(subject.receipt).to include("burritos", "tacos")
    end
  end
end
