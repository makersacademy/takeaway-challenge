describe Order do
  subject(:order) { described_class.new(:pizza)}

  describe '#initialize' do

    it 'creates an empty order' do
      expect(order.selected_dishes).to be_empty
    end

    it 'has a zero total' do
      expect(order.total).to eq 0
    end

    it 'sets a category' do
      expect(order.category).to be :pizza
    end

  end

end
