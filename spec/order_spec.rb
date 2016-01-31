require 'order'
require 'menu'

describe Order do
  let(:menu_list) { {
    :caesar_salad => 4,
    :gazpacho => 3,
    :tartiflette => 6,
    :butternut_squash_risotto => 6,
    :roasted_vegetables => 6,
    :pumpkin_pie => 2,
    :eclair => 2 } }
  subject(:order) {described_class.new(menu_list)}
  # let(:menu_list) {double (:menu_list)}
  # let(:basket) {double (:basket)}


  it 'should display the menu' do
    expect(order.menu_list).to eq menu_list
  end

  describe '#add(dish)' do
    it 'should check that dishes are added to an empty basket' do
      order.add(:eclair, 3)
      expect(order.basket).to include ({:eclair => 6})
    end
  end

  describe '#view_order' do
    it 'should display the content of a basket (dish, quantity)' do
      order.add(:eclair, 3)
      expect(order.view_order).to include ({:eclair => 6})
    end
  end

end
