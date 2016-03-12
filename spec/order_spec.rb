require 'order'

describe Order do
 subject(:order) { described_class.new }
 let(:menu) { double :menu }

  describe '#add_to_order' do
    it {is_expected. to respond_to(:add_to_order).with(2).arguments }
  end

  describe '#order_total' do
    it { is_expected. to respond_to(:order_total) }
  
 
    it 'will return the correct total price of the order' do 
      allow(order).to receive(:calculate_order_total).and_return(5)
      expect(order.order_total).to eq 5
    end
  
  end

  describe '#see_dishes' do
    it 'will display a hash of dishes and prices' do
      allow(menu).to receive(:see_dishes).and_return Hash.new
      expect(order.see_dishes.class).to eq Hash
    end
  end
end
