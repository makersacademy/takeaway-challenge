require 'takeaway.rb'

describe Takeaway do
  # subject(:takeaway) {described_class.new}

  context 'Menu' do
    it 'should retreive a Menu' do
      expect(subject.menu).to be_a_kind_of(Hash)
    end

  end

  context 'Order' do
    it 'should allow the customer to create a new order' do
      expect(subject).to respond_to(:order)
    end

  end

end
