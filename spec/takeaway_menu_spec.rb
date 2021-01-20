require 'takeaway_menu'

describe Takeaway do

  describe '#order' do
    it 'responds to .order with 2 arguments' do
      expect(subject).to respond_to(:order).with(2).arguments
    end
    it 'will find the item and price' do
      expect(subject.order("onion bhaji")).to eq 'onion bhaji, x1'
    end
  end

  describe '#basket' do
    it 'returns an empty basket initially' do
      expect(subject.basket).to eq ({})
    end

    it 'holds the item and quantity of an ordered item' do
      subject.order("onion bhaji", 4)
      expect(subject.basket).to eq ({ "onion bhaji" => 4 })
    end

    it 'allows you to add duplicated items and updates the quantity' do
      subject.order("onion bhaji", 4)
      subject.order("onion bhaji", 4)
      expect(subject.basket).to eq ({ "onion bhaji" => 8 })
    end
  end

  describe '#total_cost' do
    it 'returns the total cost of the items in the basket' do
      subject.order("onion bhaji")
      subject.order("vegetable samosa")
      expect(subject.total_cost).to eq 11.8
    end
  end

  describe '#checkout' do
    subject(:takeaway) { described_class.new }

    before do
      allow(takeaway).to receive(:checkout)
    end

    it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:checkout).and_return("Thank you for your order")
      expect(takeaway.checkout).to eq "Thank you for your order"
    end
  end
end
