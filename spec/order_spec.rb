require './docs/order'
describe Order do
  describe '#select' do
    it 'can respond to select with an argument' do
      expect(subject).to respond_to(:select).with(1).argument
    end
  end
end
