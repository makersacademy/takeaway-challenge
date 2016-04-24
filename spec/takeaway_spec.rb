require 'takeaway'


describe TakeAway do
  let(:item) {double :item}
  let(:current_order) { {dish: dish, price: price} }
  subject(:takeaway) { described_class.new }
  let(:menu_list) { {chiken_foo_young: 4, chilli_spicy_chiken: 3}  }
  let(:menu) {double :menu, display_menu: {chiken_foo_young: 4}}

    describe '#see_menu' do
      it "shows the menu" do
        expect(takeaway.see_menu).to be_a Hash
      end
    end
    describe '#order' do
      it "adds an item to the order" do
        takeaway.order(item: :chiken_foo_young, qty: 1)
        expect(takeaway.current_order).to eq [{:chiken_foo_young=>4}]
      end
    end
end
