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

    it 'adds order to empty order array' do
      expect{ takeaway.place_order(31.80, { :burger => 3, :chips => 1 }) }.to change{ takeaway.order.order_array }.to [{ :burger => 10.0 }, { :burger => 10.0 }, { :burger => 10.0 }, { :chips => 1.8 }]
    end

    context 'when order verified with wrong total' do
      it 'raises error' do
        expect { takeaway.place_order(20.00, { :burger => 3, :chips => 1 }) }.to raise_error("Error: The total given does not equal the menu total")
      end
    end

    context 'when order verified with correct total' do
      it 'prints order placed message' do
        expect(takeaway.place_order(31.80, { :burger => 3, :chips => 1 })).to eq "The order was placed"
      end
    end
  end

  # describe '#verify_order' do
  #   context 'when order total correct' do
  #     it 'calls verify which sucessfully places order' do
  #       takeaway.place_order(31.80, { :burger => 3, :chips => 1 })
  #       expect(takeaway.verify_order(31.80)).to eq "order was placed"
  #     end
  #   end
  # end
end
