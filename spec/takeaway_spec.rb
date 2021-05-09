require 'takeaway'

describe Takeaway do
  let (:menu_items) {[
    {name: "item_one", price: 2.50, quantity: 1}, 
    {name: "item_two", price: 5.00, quantity: 1}
    ]}
  let (:menu) { double(:menu, items: menu_items, display: "Test Menu")}
  let (:order) {double(:order, current: [{name: "item_one", price: 2.50, quantity: 1}], display: "Test Order")}
  subject {described_class.new(menu, order)}

  describe '#display_menu' do
    it 'displays the menu' do
      expect(subject.display_menu).to eq("Test Menu")
    end
  end
  describe '#display_order' do
    it 'displays the current order' do
      expect(subject.display_order).to eq("Test Order")
    end
  end

  describe '#add_to_order' do
    context 'when items are available' do
      it 'updates the quantity in menu items' do
        subject.add_to_order("item_one", 1)
        expect(menu.items[0][:quantity]).to eq(0)
      end
      context 'and not in order already' do
        it 'adds item to order' do
          subject.add_to_order("item_two", 1)
          selected_item = {name: "item_two", price: 5.0, quantity: 1}
          expect(subject.order.current.last).to eq(selected_item)
        end
      end
      context 'and in order already' do
        it 'updates the quantity' do
          subject.add_to_order("item_one", 1)
          expect(subject.order.current.first[:quantity]).to eq(2)
        end
      end
    end
  end
end
