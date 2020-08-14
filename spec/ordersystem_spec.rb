require 'ordersystem'

describe OrderSystem do
  let(:dish) { double :dish }
  let(:price) { double :price }

  describe '#view_menu' do
    it 'returns a menu hash' do
      expect(subject.view_menu).to include({ dish: be_an(String), price: be_an(Integer) })
    end
  end
end
