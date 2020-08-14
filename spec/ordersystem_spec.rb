require 'ordersystem'

describe OrderSystem do
  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:takeaway) { TakeawayKitchen.new.menu }
  
  it 'returns the menu from TakeawayKitchen' do
    expect(subject.menu).to eq takeaway
  end

  describe '#view_menu' do
    it 'returns a hash' do
      expect(subject.view_menu).to include({ dish: be_an(String), price: be_an(Integer) })
    end
  end
end
