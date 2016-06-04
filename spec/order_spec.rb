describe Order do

  describe '#add' do
    context 'valid order' do
      it 'take the order' do
        subject.add("chicken", 2)
        expect(subject.order_made).to eq [["chicken", 2]]
      end
    end
    context 'invalid order' do
      it 'not take the order' do
        subject.add("duck", 2)
        expect(subject.order_made).to eq []
      end
    end
  end
end
