# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require 'takeaway'

describe Takeaway do

  it 'Should have a takeaway class' do
    expect(Takeaway).to respond_to(:new)
  end

  describe '#view' do
    it 'Should show items that can be ordered' do
      expect{subject.view}.to output.to_stdout
    end
  end

  describe '#order' do
    it 'Should have an order menthod to place order' do
      expect(subject).to respond_to(:order)
    end

    it 'Should save items and prices when selecting an item number' do
      subject.order(1, 1)
      expect(subject.current_order).to eq( [{item: "Spare ribs", price: 5.99}] )
    end

    it 'should save multiple items when given a second argument' do
      subject.order(2,3)
      expect(subject.current_order).to eq( [{item: "Spring rolls", price: 3.50}, {item: "Spring rolls", price: 3.50}, {item: "Spring rolls", price: 3.50}] )
    end
  end
end
