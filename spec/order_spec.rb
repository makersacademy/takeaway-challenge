require 'order'
describe Order do
  describe 'order a dish' do
    it 'returns dish just ordered' do
      expect(subject.add_dish("Burger", 1)).to eq "Ordered - Burger x 1"
    end
  end
end
