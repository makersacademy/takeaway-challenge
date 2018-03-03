# Order class spec
require 'order'

describe Order do
  subject(:order) { Order.new() }
  let(:pm) { double :pie_mash, name: 'Pie and mash', price: 8.99 }
  let(:ctm) { double :chiken_tikka_masala, name: 'Chicken Tikka Masala', price: 6.99 }
  let(:menu) {double :menu, menu: [pm, ctm]}

  describe '#new' do
    it 'expects order[] to be empty at start' do
      expect(order.order).to eq([])
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add_to_order).with(2).arguments }
    it 'expects to add dishes to order' do
      order.add_to_order(pm, 2)
      order.add_to_order(ctm, 1)
      expect(order.order).to eq([[pm, 2], [ctm, 1]])
    end
  end

  describe 'calculate_total' do
    it { is_expected.to respond_to(:calculate_total).with(0).arguments }
    it 'should return the total for all dishes in order' do
      order.add_to_order(pm, 2)
      order.add_to_order(ctm, 1)
      expect(order.calculate_total).to eq(24.97)

    end
  end
end


# little test to see if menu double is built correctly ()
# it 'returns price for pm 8.99' do
#   expect(order.show_price_for_first_item(menu)).to eq(8.99)
# end
