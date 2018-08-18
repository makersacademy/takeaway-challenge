require 'order'
describe Order do
  describe 'order a dish' do
    it 'returns dish just ordered' do
      expect(subject.add_dish("Burger", 1, 5)).to eq "Ordered - Burger x 1"
    end

    it 'updates a current order if same dish is ordered' do
 #     subject.add_dish("Burger", 1, 5)
    end
  end
end
