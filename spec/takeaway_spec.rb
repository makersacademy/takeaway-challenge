require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }

  describe '#display' do
    it 'displays menu' do
      expect(takeaway.display).to eq [{ :chips => 1.80 }, { :burger => 10.00 }]
    end
  end

  describe '#place_order' do
    it 'takeaway responds to method place_order' do
      expect(takeaway).to respond_to(:place_order)
    end

    it 'makes new order object instance' do
      order_double = double("order")
      my_takeaway = Takeaway.new(order_double)
      expect(my_takeaway.place_order).to eq order_double
    end

    # it 'adds order to empty order array' do
    #   takeaway.order(31.80, {:burger => 3, :chips => 1})
    #   expect(takeaway.order_array).to eq [{:burger=>10.0}, {:burger=>10.0}, {:burger=>10.0}, {:chips=>1.8}]
    # end
  end
end
