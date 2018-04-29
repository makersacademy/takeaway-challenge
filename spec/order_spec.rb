require 'order'

RSpec.describe Order do
let(:dishes) { double :dishes, current_selection: current_selection }
let(:current_selection) { [{ :name=>:fish_curry, :price=>4.7, :quantity=>2 }] }
subject(:order) { described_class.new(dishes) }

  describe '#overview' do
    it 'returns the current order' do
      dishes.current_selection
      expect(subject.overview).to eq ([{ :name=>:fish_curry, :price=>4.7, :quantity=>2 }])
    end
  end

  describe '#total' do
    it 'adds all items together' do
      expect(order.total).to eq 9.4
    end
  end

  describe '#breakdown' do
    it 'shows total for each item' do
      expect(order.breakdown).to eq ([{ :name=>:fish_curry, :price=>4.7, :quantity=>2, :total=>9.4 }])
    end
  end

  describe '#confirm?' do
    it 'show you default status on order confirmation' do
      expect(order.confirmed?).to eq false
    end
  end

end
