require 'order'
require 'menu'

describe Order do
  let(:menu_list) do {
    caesar_salad: 4,
    gazpacho: 3,
    tartiflette: 6,
    butternut_squash_risotto: 6,
    roasted_vegetables: 6,
    pumpkin_pie: 2,
    eclair: 2 }
  end
  subject(:order) {described_class.new(menu_list)}
  # real class with fake bit injected
  # let(:menu_list) {double (:menu_list)}
  # let(:basket) {double (:basket)}


  # it 'should display the menu' do
  #   expect(order.menu_list).to eq menu_list
  # end

  describe '#add(dish)' do
    it 'should check that dishes are added to an empty basket' do
      order.add(:eclair, 3)
      expect(order.basket).to include ({eclair: 6})
    end
  end

  describe '#view_order' do
    it 'should display the content of a basket (dish, quantity)' do
      order.add(:eclair, 3)
      expect(order.view_order).to include ({eclair: 6})
    end
  end

  describe '#order_total' do
    xit 'should display the total amount of an order' do
      order.add(:eclair, 3)
      order.add(:tartiflette, 2)
      expect(order.order_total).to eq
    end
  end

end
