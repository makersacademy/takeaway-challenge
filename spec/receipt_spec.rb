require 'receipt'

RSpec.describe Receipt do
  let(:dish) { instance_double Dish, name: "Tikka Masala", price: 10.99 }
  let(:dish2) { instance_double Dish, name: "Burger", price: 7.99 }
  subject { Receipt.new([dish, dish2], 18.98) }
  describe '#receipt' do
    it 'returns an itemised receipt with the total' do
      expect(subject.print).to eq [["Tikka Masala - £10.99"], ["Burger - £7.99"], "Total: £18.98"]
    end
  end
end
