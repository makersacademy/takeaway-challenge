require 'order'

describe Order do
  subject(:order) {described_class.new}

  describe '#take_order' do
    it 'calls the take_order method' do
      expect(order).to respond_to(:take_order)
    end

    it 'expects the order total to be calculated correctly'


    it 'stops when done is entered'

    it 'doesnt accept a dish that doesnt exist'



  end
end
