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

    it 'Should return an price when selecting an item number' do
      expect(subject.order(1, 1)).to eq(5.99)
    end

    it 'Should allow user to order multiples if they would like' do
      expect(subject.order(3, 3)).to eq(18.00)
    end
  end
end
