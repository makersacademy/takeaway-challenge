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
    
    it 'calls the order method' do
      order_double = double("order")
      my_takeaway = Takeaway.new(order_double)
      allow(order_double).to receive(:order).and_return([{:burger=>10.0}, {:burger=>10.0}, {:burger=>10.0}, {:chips=>1.8}])
      expect(my_takeaway.place_order(31.80, {:burger => 3, :chips => 1})).to eq [{:burger=>10.0}, {:burger=>10.0}, {:burger=>10.0}, {:chips=>1.8}]
    end
  end
end
