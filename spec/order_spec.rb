describe Order do
  describe '#initialize' do
    it 'returns an empty order list object' do
      expect(subject.order_list).to eq({})
    end
  end
end