require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }

  describe '#display' do
    it 'displays menu' do
      expect(takeaway.display).to eq takeaway.menu
    end
  end

  describe '#place_order' do
    it 'takeaway responds to method place_order' do
      expect(takeaway).to respond_to(:place_order)
    end

    # it 'returns order object instance' do
    #   order_double = double("order")
    #   my_takeaway = Takeaway.new(order_double)
    #   expect(my_takeaway.place_order(31.80, {:burger => 3, :chips => 1})).to eq order_double
    # end
  end
end
