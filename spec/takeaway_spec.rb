require 'takeaway.rb'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  context 'Order' do

    it 'should allow a new order to be created' do
      expect(takeaway.order).to be_a_kind_of(Order)
    end

  context '.place_order' do
    message = "The special,1,Chicago classic,2,Meat & more meat,1,=£73"
    it 'should allow the place_order method to accept a message' do
      expect(takeaway).to receive(:place_order).with(message)
      takeaway.place_order(message)
    end
  end

  end

end
