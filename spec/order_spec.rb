require 'order'

describe Order do
  describe '#order' do
    it 'can respond to order' do
      expect(subject).to respond_to(:order)
    end
  end
end
