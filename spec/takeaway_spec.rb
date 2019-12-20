require 'takeaway'

describe Takeaway do
  it 'instantiates a Takeaway class' do
    expect(subject).to be_a_kind_of Takeaway
  end

  describe '#menu' do
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
end
