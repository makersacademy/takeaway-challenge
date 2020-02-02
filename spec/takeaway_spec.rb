require 'takeaway'

describe Takeaway do
  describe '#menu' do
    it 'should print out the menu' do
      expect(subject.menu).to be_truthy
    end
  end
  
  describe '#order' do
    it 'should start the ordering process' do
      expect(subject.place_order).to eq("What would you like to order? (type DONE to finish)")
    end
  end
end