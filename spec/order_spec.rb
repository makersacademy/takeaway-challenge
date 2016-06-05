describe Order do

subject(:order) {described_class.new}

  describe '#add' do

    context 'valid order' do
      it 'take the order' do
        order.add("chicken", 2)
        expect(order.order_made).to eq [["chicken", 2]]
      end
    end

    context 'invalid order' do
      it 'not take the order' do
        order.add("duck", 2)
        expect(order.order_made).to eq []
      end
    end

  end
end
